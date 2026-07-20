;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages lutgen)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (shika utils cargo)
  #:use-module (gnu packages rust-apps)
  #:use-module ((guix licenses) #:prefix license:))

(define-public lutgen
  (package
    (name "lutgen")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "lutgen-cli" version))
       (file-name (string-append "lutgen-cli" "-" version ".tar.gz"))
       (sha256
        (base32 "0vxa4z3gz57ilkfmdyqprv395zd92wqvmf3jjb88wx5a7ymfv0zj"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (shika-cargo-inputs 'lutgen))
    (home-page "https://github.com/ozwaldorf/lutgen-rs")
    (synopsis "Blazingly fast interpolated LUT generator and applicator
for arbitrary and popular color palettes.")
    (description
     "A blazingly fast interpolated LUT utility for arbitrary and popular
color palettes. Theme any image to your desktop colorscheme!")
    (license license:expat)))

lutgen
