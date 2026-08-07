;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages docker)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (shika build-system nix-go)
  #:use-module (guix git-download)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages golang)
  #:use-module ((gnu packages docker) #:prefix gnu:)
  #:use-module ((guix licenses) #:prefix license:))

(define-public docker-compose
  (package/inherit gnu:docker-compose
    (name "docker-compose")
    (version "5.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/docker/compose")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256 (base32
                       "1phmch4yvp0q16qjll0lxi7in0izh6si80vi6ga6j8snahkjkc04"))))
    (build-system nix-go-build-system)
    (supported-systems '("x86_64-linux"))
    (inputs '())
    (native-inputs '())
    (arguments `(#:vendor-hash
                 "0wijf03lfcxcj0rx6l5g79z3nmjysv5q4aqjnqpj8jha0dxdad8z"
                 #:go ,go-1.26
                 #:sub-packages ,(list "./cmd")
                 #:ldflags (list "-w" "-X"
                                 ,(string-append
                                   "github.com/docker/compose/v5/internal.Version=v"
                                   version))
                 #:phases (modify-phases %standard-phases
                            (add-after 'install 'install-cli-plugin
                              (lambda* (#:key outputs #:allow-other-keys)
                                (let* ((out (assoc-ref outputs "out"))
                                       (old (string-append out "/bin/cmd"))
                                       (new "/libexec/docker/cli-plugins/docker-compose"))
                                  (mkdir-p (dirname (string-append out new)))
                                  (rename-file old (string-append out new))
                                  (symlink (string-append ".." new)
                                           (string-append out "/bin/docker-compose"))))))))))

(define-public docker-buildx
  (package
    (name "docker-buildx")
    (version "0.36.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/docker/buildx")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fhhcyg0zbn136qmv9gf1ihmg6b1qxn0bqdd4cxxzxjc7027lh5v"))))
    (build-system nix-go-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     `(#:vendor-hash "0ldcqjm4w2fim2ycm1c3xkriygmc2apn8gnnlx2673d3ckw2bmvg"
       #:go ,go-1.26
       #:sub-packages ,(list "./cmd/buildx")
       #:ldflags (list "-s"
                       "-w"
                       "-X"
                       ,(string-append
                         "github.com/docker/buildx/version.Version=v" version)
                       "-X"
                       "github.com/docker/buildx/version.Package=github.com/docker/buildx")
       #:phases (modify-phases %standard-phases
                  (add-after 'install 'install-cli-plugin
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (old (string-append out "/bin/buildx"))
                             (new "/libexec/docker/cli-plugins/docker-buildx"))
                        (mkdir-p (dirname (string-append out new)))
                        (rename-file old (string-append out new))
                        (symlink (string-append ".." new)
                                 (string-append out "/bin/docker-buildx"))))))))
    (home-page "https://github.com/docker/buildx")
    (synopsis "Docker CLI plugin for extended build capabilities")
    (description
     "Docker Buildx is a Docker CLI plugin for extended build capabilities
with BuildKit.")
    (license license:asl2.0)))

(define docker-cli
  (package/inherit gnu:docker-cli
    (source
     (origin
       (inherit (package-source gnu:docker-cli))
       (patches (list (local-file "patches/docker-cli-plugin-dir.patch")))))))

(define-public docker-full
  (package
    (name "docker-full")
    (version (package-version docker-cli))
    (source #f)
    (build-system trivial-build-system)
    (inputs (list docker-cli
                  docker-compose
                  docker-buildx
                  bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((docker-cli #$(this-package-input "docker-cli"))
                 (compose #$(this-package-input "docker-compose"))
                 (buildx #$(this-package-input "docker-buildx"))
                 (cli-plugins "/libexec/docker/cli-plugins")
                 (plugin-dirs (string-append
                               compose cli-plugins ":"
                               buildx cli-plugins))
                 (wrapper (string-append #$output "/bin/docker"))
                 (out #$output))
            (mkdir-p out)
            (symlink (string-append docker-cli "/etc")
                     (string-append out "/etc"))
            (symlink (string-append docker-cli "/share")
                     (string-append out "/share"))
            (mkdir-p (dirname wrapper))
            (call-with-output-file wrapper
              (lambda (port)
                (format port "#!~a~%export DOCKER_CLI_PLUGIN_DIRS=~a~%exec ~a/bin/docker \"$@\"~%"
                        #$(file-append bash-minimal "/bin/sh")
                        plugin-dirs
                        docker-cli)))
            (chmod wrapper #o755)))))
    (home-page (package-home-page docker-cli))
    (synopsis (string-append (package-synopsis docker-cli)
                             " with compose and buildx plugins"))
    (description
     (string-append
      (package-description docker-cli)
      "  Includes Docker Compose and Buildx CLI plugins."))
    (license (package-license docker-cli))))
