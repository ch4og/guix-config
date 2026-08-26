;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build binary-utils)
  #:use-module (guix build utils)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-13)
  #:export (input-library-paths
            patch-binary-interpreter
            wrap-binaries-with-ld
            wrap-binaries-direct
            wrap-binaries-pkg))

(define (input-library-paths inputs)
  (search-path-as-list '("lib" "lib64" "lib/nss")
                       (filter string? (map cdr inputs))))

(define (binary-paths out plan)
  (match plan
    ((binary hidden)
     (let ((binary (string-append out "/" binary)))
       (values binary (string-append (dirname binary) "/" hidden))))
    (_
     (error "binary-utils: invalid wrapper plan entry" plan))))

(define (prepare-binary out plan)
  (call-with-values
      (lambda () (binary-paths out plan))
    (lambda (binary hidden)
      (unless (file-exists? binary)
        (error "binary-utils: wrapper target does not exist" binary))
      (when (file-is-directory? binary)
        (error "binary-utils: wrapper target is a directory" binary))
      (when (file-exists? hidden)
        (error "binary-utils: wrapper target already exists" hidden))
      (chmod binary #o755)
      (rename-file binary hidden)
      (values binary hidden))))

(define* (patch-binary-interpreter binary #:key inputs dynamic-linker)
  (let ((patchelf (search-input-file inputs "bin/patchelf"))
        (interpreter (string-append (assoc-ref inputs "glibc")
                                    dynamic-linker)))
    (invoke patchelf "--set-interpreter" interpreter binary)))

(define (write-wrapper binary body)
  (call-with-output-file binary
    (lambda (port)
      (display body port)))
  (chmod binary #o755))

(define (input-shell inputs)
  (search-input-file inputs "bin/sh"))

(define* (wrap-binaries-with-ld #:key inputs outputs wrapper-plan dynamic-linker
                                #:allow-other-keys)
  (let* ((out (assoc-ref outputs "out"))
         (ld (string-append (assoc-ref inputs "glibc") dynamic-linker))
         (shell (input-shell inputs))
         (library-path (string-join (input-library-paths inputs) ":")))
    (for-each
     (lambda (plan)
       (call-with-values
           (lambda () (prepare-binary out plan))
         (lambda (binary hidden)
           (write-wrapper
            binary
            (string-append
             "#!" shell "\nexport LD_LIBRARY_PATH=\""
             library-path "${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\"\n"
             "exec " ld " --argv0 \"$0\" --library-path " library-path
             " " hidden " \"$@\"\n")))))
     wrapper-plan)))

(define* (wrap-binaries-direct #:key inputs outputs wrapper-plan
                               #:allow-other-keys)
  (let* ((out (assoc-ref outputs "out"))
         (shell (input-shell inputs))
         (library-path (string-join (input-library-paths inputs) ":")))
    (for-each
     (lambda (plan)
       (call-with-values
           (lambda () (prepare-binary out plan))
         (lambda (binary hidden)
           (write-wrapper
            binary
            (string-append
             "#!" shell "\nexport LD_LIBRARY_PATH=\""
             library-path "${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\"\n"
             "exec -a \"$0\" " hidden " \"$@\"\n")))))
     wrapper-plan)))

(define* (wrap-binaries-pkg #:key inputs outputs wrapper-plan
                            #:allow-other-keys)
  (let* ((out (assoc-ref outputs "out"))
         (shell (input-shell inputs))
         (library-path (string-join (input-library-paths inputs) ":")))
    (for-each
     (lambda (plan)
       (call-with-values
           (lambda () (prepare-binary out plan))
         (lambda (binary hidden)
           (write-wrapper
            binary
            (string-append
             "#!" shell "\nexport LD_LIBRARY_PATH=\""
             library-path "${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}\"\n"
             "exec " hidden " \"$@\"\n")))))
     wrapper-plan)))
