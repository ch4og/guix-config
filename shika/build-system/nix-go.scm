;;; SPDX-FileCopyrightText: 2025 Ashish SHUKLA <ashish.is@lostca.se>
;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build-system nix-go)
  #:use-module (guix build-system)
  #:use-module (guix build utils)
  #:use-module (guix base32)
  #:use-module (guix gexp)
  #:use-module (guix monads)
  #:use-module (guix store)
  #:use-module (guix records)
  #:use-module (guix utils)
  #:use-module (guix modules)
  #:use-module (guix search-paths)
  #:use-module ((guix packages) #:prefix pkgs:)
  #:use-module ((guix build gnu-build-system) #:prefix gnu:)
  #:use-module ((gnu packages nss) #:select (nss-certs))
  #:use-module ((gnu packages version-control) #:select (git-minimal))
  #:use-module (guix build-system gnu)
  #:export (nix-go-build-system
            %nix-go-build-system-modules
            nix-go-build
            %standard-phases))

(define %nix-go-build-system-modules
  `((guix build utils)
    ;; (guix gexp)
    ;; (guix build-system)
    (shika build nix-go-build-system)
    ,@%default-gnu-imported-modules))

(define (default-go)
  ;; Lazily resolve the binding to avoid a circular dependency.
  (let ((go (resolve-interface '(gnu packages golang))))
    (module-ref go 'go-1.25)))

(define-record-type* <go-vendor-config> go-vendor-config
  make-go-vendor-config
  go-vendor-config?
  (url go-vendor-config-url
       (default #f))
  (toolchain go-vendor-config-toolchain
             (default #f))
  (tidy? go-vendor-config-tidy?
         (default #t)))

(define* (lower name
                #:key
                source
                inputs
                native-inputs
                outputs
                system
                target
                (build-flags '())
                (go #f)
                (tidy? #t)
                (vendor-hash #f)
                (ldflags #f)
                #:allow-other-keys
                #:rest arguments)
  "Return a bag for NAME."

  (define private-keywords
    '(#:target #:go #:inputs #:native-inputs #:vendor-hash #:tidy?))

  (define* (go-vendor-fetch cfg
                            hash-algo
                            hash
                            name
                            #:key system)
    (let ((pkg (go-vendor-config-url cfg))
          (go-toolchain (go-vendor-config-toolchain cfg))
          (tidy? (go-vendor-config-tidy? cfg)))
      (gexp->derivation (string-append name "-vendor")
                        #~(begin
                            (let ((tmpdir (or (getenv "TMPDIR") "/tmp")))
                              (use-modules (guix build utils)
                                           (guix search-paths))

                              (setenv "PATH"
                                      (cdar (evaluate-search-paths (list $PATH)
                                                                   (list #$git-minimal
                                                                         #$go-toolchain
                                                                         #$@(map
                                                                             cadr
                                                                             (standard-packages))))))

                              (setenv "SSL_CERT_DIR" (string-append #$nss-certs "/etc/ssl/certs"))
                              (setenv "GOPATH" (string-append tmpdir "/go"))
                              (setenv "GOCACHE" (string-append tmpdir "/go-cache"))
                              (setenv "GOPROXY" "https://proxy.golang.org|direct")
                              (setenv "GOTELEMETRY" "off")
                              (setenv "GO111MODULE" "on")
                              (setenv "GOTOOLCHAIN" "local")
                              (setenv "CGO_ENABLED" "0")

                              (let ((st (stat #$source)))
                                (if (eq? (stat:type st) 'directory)
                                    (invoke "cp" "-r" "--reflink=auto" #$source "modRoot")
                                    (begin
                                      (mkdir-p "modRoot")
                                      (invoke "tar" "xvf" #$source "--strip-components=1" "-C" "modRoot"))))

                              (chdir "modRoot")
                              (chmod "." #o755)
                              (chmod "go.mod" #o644)
                              (chmod "go.sum" #o644)
                              (invoke "chmod" "-R" "u+w" ".")

                              (when #$tidy?
                                (invoke "go" "mod" "tidy"))
                              (invoke "go" "mod" "vendor")
                              (mkdir-p "vendor")
                              (mkdir-p #$output)

                              (invoke "cp" "-r" "--reflink=auto" "go.mod" "go.sum" "vendor"
                                      #$output)))

                        #:modules '((guix build utils)
                                    (guix records)
                                    (guix search-paths))
                        #:local-build? #t
                        #:recursive? #t
                        #:system system
                        #:hash-algo hash-algo
                        #:hash hash
                        #:leaked-env-vars '("http_proxy"
                                            "https_proxy"
                                            "LC_ALL"
                                            "LC_MESSAGES"
                                            "LANG"
                                            "COLUMNS"))))

  (define (vendor-origin name vendor-hash go-toolchain tidy?)
    (pkgs:origin (method go-vendor-fetch)
                 (uri (go-vendor-config (url source)
                                        (toolchain go-toolchain)
                                        (tidy? tidy?)))
                 (file-name name)
                 (hash (pkgs:content-hash (nix-base32-string->bytevector vendor-hash) sha256))))

  (define go-os
    (cadr (string-split system #\-)))

  (define go-arch
    (let ((arch (car (string-split system #\-))))
      (cond
       ((string=? arch "x86_64") "amd64")
       ((string=? arch "aarch64") "arm64")
       (else #f))))

  (define go-toolchain
    (if go
        go
        (default-go)))

  (bag (name name)
       (system system)
       (target target)
       (build-inputs `(,@(if source
                             `(("source" ,source))
                             '()) ,@(if vendor-hash
                                        `(("vendor" ,(vendor-origin name
                                                                    vendor-hash
                                                                    go-toolchain
                                                                    tidy?)))
                                        '())
                             ,@`(("go" ,go-toolchain))
                             ,@native-inputs
                             ,@inputs
                             ,@(if target
                                   ;; Use the standard cross inputs of
                                   ;; 'gnu-build-system'.
                                   (standard-cross-packages target 'host)
                                   '())
                             ;; Keep the standard inputs of 'gnu-build-system'.
                             ,@(standard-packages)))
       (host-inputs '())

       ;; The cross-libc is really a target package, but for bootstrapping
       ;; reasons, we can't put it in 'host-inputs'.  Namely, 'cross-gcc' is a
       ;; native package, so it would end up using a "native" variant of
       ;; 'cross-libc' (built with 'gnu-build'), whereas all the other packages
       ;; would use a target variant (built with 'gnu-cross-build'.)
       (target-inputs (if target
                          (standard-cross-packages target
                                                   'target)
                          '()))

       (outputs outputs)
       (build nix-go-build)
       (arguments (cons* #:build-flags build-flags
                         #:goos go-os
	                 #:goarch go-arch
                         #:go-version (pkgs:package-version go-toolchain)
                         (strip-keyword-arguments private-keywords arguments)))))

(define* (nix-go-build name
                       inputs
                       #:key
                       source
                       go-version
                       (phases '%standard-phases)
                       (outputs '("out"))
                       (search-paths '())
                       (install-source? #f)
                       (build-flags '())
                       (tests? #t)
                       (parallel-build? #t)
                       (parallel-tests? #t)
                       (allow-go-reference? #f)
                       (system (%current-system))
                       (goarch #f)
                       (goos #f)
                       (ldflags #f)
                       (tags #f)
                       (sub-packages '("."))
                       (guile #f)
                       (imported-modules %nix-go-build-system-modules)
                       (modules '((shika build nix-go-build-system)
                                  (guix build utils)))

                       (substitutable? #t))

  (define builder
    (with-imported-modules imported-modules
      #~(begin
          (use-modules #$@(sexp->gexp modules))

          (define %outputs
            #$(outputs->gexp outputs))

          (nix-go-build #:name #$name
                        #:go-version #$go-version
                        #:source #+source
                        #:system #$system
                        #:phases #$phases
                        #:outputs #$(outputs->gexp outputs)
                        #:substitutable? #$substitutable?
                        #:goarch #$goarch
                        #:goos #$goos
                        #:ldflags #$ldflags
                        #:tags #$tags
                        #:sub-packages (list #$@sub-packages)
                        #:search-paths '#$(sexp->gexp (map
                                                       search-path-specification->sexp
                                                       search-paths))
                        #:install-source? #$install-source?
                        #:build-flags (list #$@build-flags)
                        #:tests? #$tests?
                        #:parallel-build? #$parallel-build?
                        #:parallel-tests? #$parallel-tests?
                        #:allow-go-reference? #$allow-go-reference?
                        #:inputs #$(input-tuples->gexp inputs)))))

  (mlet %store-monad
      ((guile (pkgs:package->derivation (or guile
                                            (pkgs:default-guile)) system
                                            #:graft? #f)))
    (gexp->derivation name
                      builder
                      #:system system
                      #:guile-for-build guile)))

(define nix-go-build-system
  (build-system (name 'nix-go)
                (description
                 "Build system for Go programs")
                (lower lower)))
