;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build complex-binary-build-system)
  #:use-module (guix build utils)
  #:use-module ((guix build copy-build-system) #:prefix copy:)
  #:use-module (guix elf)
  #:use-module (rnrs bytevectors)
  #:use-module (rnrs io ports)
  #:use-module (srfi srfi-13)
  #:use-module (ice-9 match)
  #:export (%standard-phases complex-binary-build))

(define %pkg-prelude-marker
  (string->utf8
   "(function(process, require, console, EXECPATH_FD, PAYLOAD_POSITION, PAYLOAD_SIZE) {"))

(define (read-binary-file file)
  (call-with-input-file file
    (lambda (port)
      (get-bytevector-all port))))

(define (write-binary-file file bytes)
  (call-with-output-file file
    (lambda (port)
      (put-bytevector port bytes))))

(define (bytevector-matches? bytes offset pattern)
  (and (<= (+ offset (bytevector-length pattern))
           (bytevector-length bytes))
       (let loop ((index 0))
         (or (= index (bytevector-length pattern))
             (and (= (bytevector-u8-ref bytes (+ offset index))
                     (bytevector-u8-ref pattern index))
                  (loop (+ index 1)))))))

(define (padded-number number width)
  (let* ((text (number->string number))
         (padding (- width (string-length text))))
    (and (>= padding 0)
         (string->utf8
          (string-append text (make-string padding #\space))))))

(define (replace-bytevector! bytes offset replacement)
  (bytevector-copy! replacement 0 bytes offset
                    (bytevector-length replacement)))

(define (single-bytevector-offset bytes pattern label)
  (let loop ((index 0)
             (found #f))
    (cond
     ((> (+ index (bytevector-length pattern))
         (bytevector-length bytes))
      (or found
          (error "complex-binary: expected one pkg metadata slot" label)))
     ((and (= (bytevector-u8-ref bytes index)
              (bytevector-u8-ref pattern 0))
           (bytevector-matches? bytes index pattern))
      (if found
          (error "complex-binary: expected one pkg metadata slot" label)
          (loop (+ index 1) index)))
     (else
      (loop (+ index 1) found)))))

(define (elf-payload-position bytes)
  (let ((elf (parse-elf bytes)))
    (unless (and (= (elf-word-size elf) 8)
                 (= (elf-machine-type elf) EM_X86_64)
                 (= (bytevector-u8-ref bytes 5) 1))
      (error "complex-binary: unsupported pkg ELF"))
    (let* ((section-offset (elf-shoff elf))
           (section-size (elf-shentsize elf))
           (section-count (elf-shnum elf))
           (position (+ section-offset (* section-size section-count))))
      (unless (and (> section-size 0)
                   (> section-count 0)
                   (<= position (bytevector-length bytes)))
        (error "complex-binary: invalid pkg ELF section table"))
      position)))

(define (pkg-metadata bytes)
  (let* ((length (bytevector-length bytes))
         (payload-position (elf-payload-position bytes))
         (prelude-position
          (single-bytevector-offset bytes %pkg-prelude-marker "prelude"))
         (payload-size (- prelude-position payload-position))
         (prelude-size (- length prelude-position))
         (payload-slot
          (single-bytevector-offset
           bytes (padded-number payload-position 22) "payload position"))
         (payload-size-slot
          (single-bytevector-offset
           bytes (padded-number payload-size 18) "payload size"))
         (prelude-slot
          (single-bytevector-offset
           bytes (padded-number prelude-position 22) "prelude position"))
         (prelude-size-slot
          (single-bytevector-offset
           bytes (padded-number prelude-size 18) "prelude size")))
    (unless (and (< payload-position prelude-position)
                 (< prelude-position length)
                 (< payload-slot prelude-position)
                 (< payload-size-slot prelude-position)
                 (< prelude-slot prelude-position)
                 (< prelude-size-slot prelude-position))
      (error "complex-binary: invalid pkg metadata"))
    (list payload-position payload-size prelude-position prelude-size
          payload-slot payload-size-slot prelude-slot prelude-size-slot)))

(define (pkg-anchor bytes offset length)
  (let ((anchor (make-bytevector length)))
    (bytevector-copy! bytes offset anchor 0 length)
    anchor))

(define* (repair-pkg-binary binary #:key inputs)
  (let* ((old-bytes (read-binary-file binary))
         (old-info (pkg-metadata old-bytes))
         (old-payload-position (list-ref old-info 0))
         (old-payload-size (list-ref old-info 1))
         (old-prelude-position (list-ref old-info 2))
         (old-prelude-size (list-ref old-info 3))
         (old-payload-anchor (pkg-anchor old-bytes old-payload-position 64))
         (old-prelude-anchor (pkg-anchor old-bytes old-prelude-position 64))
         (patchelf (search-input-file inputs "bin/patchelf"))
         (ld (string-append (assoc-ref inputs "glibc")
                            "/lib/ld-linux-x86-64.so.2")))
    (invoke patchelf "--set-interpreter" ld binary)
    (let* ((new-bytes (read-binary-file binary))
           (new-length (bytevector-length new-bytes))
           (new-payload-position (elf-payload-position new-bytes))
           (delta (- new-payload-position old-payload-position))
           (new-prelude-position (+ new-payload-position old-payload-size)))
      (unless (and (> delta 0)
                   (= new-length (+ new-payload-position
                                    old-payload-size old-prelude-size))
                   (= new-prelude-position (- new-length old-prelude-size))
                   (bytevector-matches? new-bytes new-payload-position
                                          old-payload-anchor)
                   (bytevector-matches? new-bytes new-prelude-position
                                          old-prelude-anchor))
        (error "complex-binary: patchelf changed pkg layout unexpectedly" binary))
      (let* ((old-payload-slot (list-ref old-info 4))
             (old-payload-size-slot (list-ref old-info 5))
             (old-prelude-slot (list-ref old-info 6))
             (old-prelude-size-slot (list-ref old-info 7))
             (shifted-payload-slot (+ old-payload-slot delta))
             (shifted-payload-size-slot (+ old-payload-size-slot delta))
             (shifted-prelude-slot (+ old-prelude-slot delta))
             (shifted-prelude-size-slot (+ old-prelude-size-slot delta)))
        (unless (and (bytevector-matches? new-bytes shifted-payload-slot
                                            (padded-number old-payload-position 22))
                     (bytevector-matches? new-bytes shifted-payload-size-slot
                                            (padded-number old-payload-size 18))
                     (bytevector-matches? new-bytes shifted-prelude-slot
                                            (padded-number old-prelude-position 22))
                     (bytevector-matches? new-bytes shifted-prelude-size-slot
                                            (padded-number old-prelude-size 18)))
          (error "complex-binary: pkg metadata slots moved unexpectedly" binary))
        (replace-bytevector! new-bytes shifted-payload-slot
                             (padded-number new-payload-position 22))
        (replace-bytevector! new-bytes shifted-prelude-slot
                             (padded-number new-prelude-position 22))
        (write-binary-file binary new-bytes)))))

(define (input-library-paths inputs)
  (search-path-as-list '("lib" "lib64")
                       (filter string? (map cdr inputs))))

(define* (repair-pkg-binaries #:key inputs outputs wrapper-plan wrapper-mode
                              #:allow-other-keys)
  (when (eq? wrapper-mode 'pkg)
    (let ((out (assoc-ref outputs "out")))
      (for-each
       (lambda (plan)
         (match plan
           ((binary _)
            (repair-pkg-binary (string-append out "/" binary)
                               #:inputs inputs))
           (_
            (error "complex-binary: invalid wrapper plan entry" plan))))
       wrapper-plan))))

(define* (create-binary-wrapper #:key inputs outputs wrapper-plan wrapper-mode
                             #:allow-other-keys)
  "Wrap the binaries listed in WRAPPER-PLAN with the Guix dynamic linker.
Each plan entry is (BINARY HIDDEN-NAME), where both paths are relative to the
output and HIDDEN-NAME is placed alongside BINARY."
  (unless (memq wrapper-mode '(dynamic-linker pkg))
    (error "complex-binary: unknown wrapper mode" wrapper-mode))
  (let* ((out (assoc-ref outputs "out"))
         (ld (string-append (assoc-ref inputs "glibc")
                            "/lib/ld-linux-x86-64.so.2"))
         (library-path (string-join (input-library-paths inputs) ":")))
    (for-each
     (lambda (plan)
       (match plan
         ((binary hidden)
          (let* ((binary (string-append out "/" binary))
                 (hidden (string-append (dirname binary) "/" hidden)))
            (unless (file-exists? binary)
              (error "complex-binary: wrapper target does not exist" binary))
            (when (file-is-directory? binary)
              (error "complex-binary: wrapper target is a directory" binary))
            (when (file-exists? hidden)
              (error "complex-binary: wrapper target already exists" hidden))
            (chmod binary #o755)
            (rename-file binary hidden)
            (call-with-output-file binary
              (lambda (port)
                (display
                 (if (eq? wrapper-mode 'pkg)
                     (string-append
                      "#!/bin/sh\nexport LD_LIBRARY_PATH=\""
                      library-path "${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\"\n"
                      "exec " hidden " \"$@\"\n")
                     (string-append "#!/bin/sh\nexec " ld
                                     " --library-path " library-path
                                     " " hidden " \"$@\"\n"))
                 port)))
            (chmod binary #o755)))
         (_
          (error "complex-binary: invalid wrapper plan entry" plan))))
     wrapper-plan)))

(define* (complex-binary-build #:key inputs (phases %standard-phases)
                           #:allow-other-keys #:rest args)
  "Build the given complex binary package."
  (apply copy:copy-build #:inputs inputs #:phases phases args))

(define %standard-phases
  (modify-phases copy:%standard-phases
    (delete 'validate-runpath)
    (delete 'strip)
    (add-after 'install 'repair-pkg-binaries repair-pkg-binaries)
    (add-after 'repair-pkg-binaries 'create-binary-wrapper create-binary-wrapper)))
