;;; SPDX-FileCopyrightText: 2026 Franz Geffke <mail@gofranz.com>
;;; SPDX-FileCopyrightText: 2026 Andrew Tropin <andrew@trop.in>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages opencode)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages xorg)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses) #:prefix license:))

(define-public opencode-bin
  (package
    (name "opencode-bin")
    (version "1.17.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/anomalyco/opencode/"
                           "releases/download/v" version
                           "/opencode-linux-x64.tar.gz"))
       (sha256
        (base32 "0bpdag6zg529xlfkwzsz82lf7i2b6qlignz7x90gcwqsjp871a1q"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:patchelf-plan #~'()
      #:strip-binaries? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-and-wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (orig (string-append out "/opencode"))
                     (bash (search-input-file inputs "bin/bash"))
                     (patchelf (search-input-file inputs "bin/patchelf"))
                     (ld.so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                     (libpath (string-join
                               (list (string-append (assoc-ref inputs "gcc") "/lib")
                                     (string-append (assoc-ref inputs "glibc") "/lib")
                                     (string-append (assoc-ref inputs "libx11") "/lib")
                                     (string-append (assoc-ref inputs "mesa") "/lib"))
                               ":")))
                ;; Only patch interpreter; full patchelf corrupts this binary.
                (invoke patchelf "--set-interpreter" ld.so orig)
                (rename-file orig (string-append orig ".real"))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/opencode")
                  (lambda (port)
                    (format port "#!~a
export LD_LIBRARY_PATH=~a${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
exec ~a.real \"$@\"~%"
                            bash libpath orig)))
                (chmod (string-append bin "/opencode") #o755)))))))
    (native-inputs (list patchelf))
    (inputs (list bash-minimal
                  `(,gcc "lib")
                  libx11
                  glibc
                  mesa))
    (home-page "https://opencode.ai")
    (synopsis "the open source AI coding agent.")
    (description "OpenCode is an open source agent that helps you write code in your terminal.")
    (license license:expat)))
