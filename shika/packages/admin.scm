;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages admin)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages gl))

(define-public fastfetch-no-zfs
  (package/inherit fastfetch-minimal
    (name "fastfetch-no-zfs")
    (inputs (modify-inputs (package-inputs fastfetch)
              (delete "zfs")))))

(define-public btop-nvidia
  (package
    (inherit btop)
    (name "btop-nvidia")
    (inputs (cons mesa
                  (package-inputs btop)))
    (arguments
     (substitute-keyword-arguments (package-arguments btop)
       ((#:make-flags flags #~(list))
        #~(cons (string-append "LDFLAGS+=-Wl,-rpath="
                               #$(this-package-input "mesa") "/lib")
                #$flags))))
    (description
     (string-append (package-description btop)
                    " NVIDIA GPU support requires using replace-mesa."))))
