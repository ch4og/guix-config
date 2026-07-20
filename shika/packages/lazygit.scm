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
    (version "0.63.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/jesseduffield/lazygit")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xx6pibl4qk3b8mi22p20yshsj0xf64653nk4r26n7n4h39mvjmx"))))
    (build-system nix-go-build-system)
    (arguments
     `(#:vendor-hash "1gs822jl4bx913mg2288rmzgippcrs8r24frvqmh5cav0mcr7cmj"
       #:ldflags `("-X" ,(string-append "main.version=" ,version)
                   "-X" "'main.buildSource=ch4og/shikanox Guix channel'")))
    (propagated-inputs (list git-minimal))
    (home-page "https://github.com/jesseduffield/lazygit")
    (synopsis "Simple terminal UI for git commands")
    (description
     "Simple terminal UI for git commands")
    (license license:expat)))

lazygit
