;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages docker)
  #:use-module (guix packages)
  #:use-module (shika build-system nix-go)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module ((gnu packages docker) #:prefix gnu:))

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
