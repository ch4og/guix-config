;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages bun)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix utils)
  #:use-module (shika build-system interpreter-binary)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages tls))

(define-public bun-bin
  (package
    (name "bun-bin")
    (version "1.3.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/oven-sh/bun/releases/download/bun-v" version
             "/bun-linux-x64.zip"))
       (sha256
        (base32 "13w4gvgwrjq9bi3ddp53hgm3z399d8i2aqpcmsaqbw2mx2pf47lm"))))
    (build-system interpreter-binary-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("bun" "bin/bun"))
      #:wrapper-plan
      #~'(("bin/bun" ".bun-real"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'create-binary-wrapper 'install-bunx-symlink
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (symlink "bun" (string-append bin "/bunx")))))
          (add-after 'patch-shebangs 'install-shell-completions
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bun (string-append (assoc-ref outputs "out") "/bin/bun"))
                    (out (assoc-ref outputs "out")))
                (for-each (lambda (completion)
                            (let* ((shell (car completion))
                                   (path (cdr completion))
                                   (file (string-append out "/" path)))
                              (mkdir-p (dirname file))
                              (setenv "SHELL" shell)
                              (with-output-to-file file
                                (lambda _
                                  (invoke bun "completions")))))
                          '(("bash" . "share/bash-completion/completions/bun")
                            ("zsh" . "share/zsh/site-functions/_bun")
                            ("fish" . "share/fish/vendor_completions.d/bun.fish")))))))))
    (inputs (list openssl))
    (native-inputs (list unzip))
    (home-page "https://bun.sh/")
    (synopsis "Fast all-in-one JavaScript runtime and toolkit")
    (description "Bun is a fast all-in-one JavaScript toolkit that provides
a runtime, bundler, test runner, and package manager.")
    (license license:expat)))

(define-public bun
  (package-with-alias "bun" bun-bin))
