;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages spotify)
  #:use-module (guix packages)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-xyz)
  #:use-module ((guix licenses) #:prefix license:))

(define-public spicetify-cli
  (package
    (name "spicetify-cli")
    (version "2.43.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/spicetify/cli")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "166zg65fk3wa7w11wn7w34ipxckhnsx6gv8xwl44cvkj7da9kczg"))))
    (build-system go-build-system)
    (inputs
     (list go-github-com-go-ini-ini
           go-github-com-mattn-go-colorable
           go-github-com-pterm-pterm
           go-golang-org-x-net
           go-golang-org-x-sys))
    (arguments
     `(#:import-path "github.com/spicetify/cli"
       #:unpack-path "github.com/spicetify/cli"
       #:go ,go-1.26
       #:tests? #f
       #:install-source? #f
       #:build-flags
       (list ,(string-append "-ldflags=-s -w -X main.version=" version))
       #:phases (modify-phases %standard-phases
                  ;; Treat the release build as a development build so the
                  ;; bundled CSS map is used instead of fetching one at runtime.
                  (add-after 'unpack 'patch-version
                    (lambda _
                      (let ((source-dir "src/github.com/spicetify/cli"))
                        (substitute* (string-append source-dir
                                                    "/src/preprocess/preprocess.go")
                          (("version != \\\"Dev\\\"")
                           ,(string-append "version != \"" version "\""))))))
                  (add-after 'install 'install-assets
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (old (string-append out "/bin/cli"))
                             (directory (string-append out "/share/spicetify"))
                             (binary (string-append directory "/spicetify"))
                             (source-dir "src/github.com/spicetify/cli"))
                        (mkdir-p directory)
                        (rename-file old binary)
                        (copy-recursively (string-append source-dir "/jsHelper")
                                          (string-append directory "/jsHelper"))
                        (install-file (string-append source-dir "/css-map.json")
                                      directory)
                        (symlink "../share/spicetify/spicetify"
                                 (string-append out "/bin/spicetify"))))))))
    (home-page "https://github.com/spicetify/cli")
    (synopsis "Command-line tool to customize Spotify client")
    (description
     "Spicetify is a command-line tool to customize the Spotify client.")
    (license license:lgpl2.1+)))

spicetify-cli
