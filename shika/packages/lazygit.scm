;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages lazygit)
  #:use-module (guix packages)
  #:use-module (shika build-system nix-go)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages version-control)
  #:use-module ((guix licenses) #:prefix license:))

(define-public lazygit
  (package
    (name "lazygit")
    (version "0.62.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/jesseduffield/lazygit")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10468lp2k7f1r8kzq1q7kjpfmpbkwpv4xbxsc1pf83vp7kpmdxsp"))))
    (build-system nix-go-build-system)
    (arguments
     `(#:vendor-hash "1xh9zaa0465gk763cvmn5yysmwx2m8l69a6mpifqdmijlxyma7cs"
       #:ldflags `("-X" ,(string-append "main.version=" ,version)
                   "-X" "'main.buildSource=ch4og/shikanox Guix channel'")))
    (propagated-inputs (list git-minimal))
    (home-page "https://github.com/jesseduffield/lazygit")
    (synopsis "Simple terminal UI for git commands")
    (description
     "Simple terminal UI for git commands")
    (license license:expat)))

lazygit
