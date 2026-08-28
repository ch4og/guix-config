;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages development)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (shika build-system nix-go)
  #:use-module (shika build-system interpreter-binary)
  #:use-module (guix git-download)
  #:use-module (nonguix utils)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages python)
  #:use-module (gnu packages skarnet)
  #:use-module ((guix licenses) #:prefix license:))

(define-public wakatime-cli
  (package
    (name "wakatime-cli")
    (version "2.25.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/wakatime/wakatime-cli")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "166b9z3fdmrkbzjg2swwhg0salj00m677flsnfwc7ss1dkr8icc1"))))
    (build-system nix-go-build-system)
    (native-inputs (list bats execline perl python))
    (arguments
     `(#:vendor-hash "08ari3pl4fbwk0adn2a6s0yy7h1dgr4axrdwcadnzpsx5ff91fn4"
       #:go ,go-1.26
       #:ldflags `("-X" ,(string-append "github.com/wakatime/wakatime-cli"
                                        "/pkg/version.Version=" ,version))))
    (home-page "https://github.com/wakatime/wakatime-cli")
    (synopsis "CLI for WakaTime")
    (description
     "Command line interface to WakaTime used by all WakaTime text editor plugins.")
    (license license:bsd-3)))

(define (corepack-wrapper tool extra-tools lic)
  (package
    (name (string-append "corepack-" tool))
    (version (package-version node-lts))
    (source #f)
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'unpack)
          (delete 'configure)
          (delete 'build)
          (delete 'check)
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (bash (search-input-file inputs "bin/bash"))
                     (node-dir (assoc-ref inputs "node"))
                     (node-bin (string-append node-dir "/bin/node"))
                     (corepack (string-append node-dir "/lib/node_modules/corepack/dist/corepack.js"))
                     (tools (cons #$tool '#$extra-tools)))
                (mkdir-p bin)
                (for-each
                 (lambda (t)
                   (call-with-output-file (string-append bin "/" t)
                     (lambda (port)
                       (format port "#!~a~%exec ~a ~a ~a \"$@\"~%"
                               bash node-bin corepack t)))
                   (chmod (string-append bin "/" t) #o755))
                 tools)))))))
    (inputs (list bash-minimal node-lts))
    (home-page "https://github.com/nodejs/corepack")
    (synopsis (string-append tool " via corepack"))
    (description (string-append tool " package manager via corepack."))
    (license lic)))

(define-public corepack-yarn
  (corepack-wrapper "yarn" '("yarnpkg") license:bsd-2))

(define-public corepack-pnpm
  (corepack-wrapper "pnpm" '("pnpx") license:expat))

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
