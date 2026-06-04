;;; SPDX-FileCopyrightText: 2025 Ashish SHUKLA <ashish.is@lostca.se>
;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build nix-go-build-system)
  #:use-module (guix build utils)
  #:use-module ((guix build gnu-build-system) #:prefix gnu:)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:export (%standard-phases nix-go-build))

(define* (setup-nix-go-environment #:key parallel-build? inputs
	                           goos system goarch go-version
	                           #:allow-other-keys)
  (let ((tmpdir (or (getenv "TMPDIR") "/tmp")))
    (setenv "TMPDIR" "/tmp")
    (setenv "GOPATH" (string-append tmpdir "/go"))
    (setenv "GOCACHE" (string-append tmpdir "/go-cache"))
    (setenv "GOPROXY" "off")
    (setenv "GOSUMDB" "off")
    (setenv "CGO_ENABLED" "0")
    (setenv "GO111MODULE" "on")
    (setenv "GOTOOLCHAIN" "local")
    (setenv "GOAMD64" "v3")
    (setenv "GOTELEMETRY" "off")
    (setenv "GOFLAGS" "-mod=vendor -trimpath")
    (setenv "GOOS" goos)
    (setenv "GOARCH" goarch)
    (setenv "GOMAXPROCS"
	    (number->string
	     (if parallel-build?
	         (parallel-job-count)
	         1)))
    (match (map string->number (string-split go-version #\.))
      ((1 major _)
       (when (> major 24)
	 (setenv "GOEXPERIMENT" "greenteagc"))))))

(define* (symlink-vendor #:key inputs #:allow-other-keys)
  (let ((vendor-dir (assoc-ref inputs "vendor")))
    (invoke "rm" "-rf" "vendor" "go.mod" "go.sum")
    (when (file-exists? (string-append vendor-dir "/go.mod"))
      (symlink (string-append vendor-dir "/go.mod") "go.mod"))
    (when (file-exists? (string-append vendor-dir "/go.sum"))
      (symlink (string-append vendor-dir "/go.sum") "go.sum"))
    (symlink (string-append vendor-dir "/vendor") "vendor")))

(define* (build #:key
                ldflags
                tags
                build-flags
                sub-packages
                #:allow-other-keys)
  (let ((tags (if (list? tags)
                  (list (string-append "-tags="
                                       (string-join tags ",")))
                  (list)))
        (ldflags (list "-ldflags"
                       (if (list? ldflags)
                           (string-join (if (every (lambda (el)
                                                     (not (string-prefix?
                                                           "-buildid=" el)))
                                                   ldflags)
                                            (cons "-buildid=" ldflags) ldflags)
                                        " ") "-buildid="))))
    (for-each (lambda (pkg)
                (apply invoke
                       `("go" "install" ,@build-flags ,@tags ,@ldflags ,pkg)))
              sub-packages)))

(define* (install #:key outputs #:allow-other-keys)
  (let* ((out (assoc-ref outputs "out"))
         (bindir (string-append out "/bin"))
         (gobin (string-append (getenv "GOPATH") "/bin")))
    (mkdir-p out)
    (when (directory-exists? gobin)
      (mkdir-p bindir)
      (copy-recursively gobin bindir))))

(define* (nix-go-build #:key
                       inputs
                       (phases %standard-phases)
                       #:allow-other-keys #:rest args)
  "Build the given Go package, applying all of PHASES in order."
  (apply gnu:gnu-build
         #:inputs inputs
         #:phases phases
         args))

(define %standard-phases
  (modify-phases gnu:%standard-phases
    (delete 'bootstrap)
    (delete 'configure)
    (delete 'patch-generated-file-shebangs)
    (delete 'check)
    (replace 'build build)
    (replace 'install install)
    (add-before 'unpack 'setup-nix-go-environment
      setup-nix-go-environment)
    (add-after 'patch-source-shebangs 'symlink-vendor
      symlink-vendor)))
