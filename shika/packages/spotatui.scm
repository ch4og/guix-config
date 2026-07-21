;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages spotatui)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages tls)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix utils)
  #:use-module (shika utils cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public spotatui
  (package
    (name "spotatui")
    (version "0.40.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/LargeModGames/spotatui")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nf4jdx8c1y48h7arj6irabpzxsmpbakm5lc0p4856mmjid17n0x"))))
    (build-system cargo-build-system)
    (native-inputs (list pkg-config))
    (inputs (cons* openssl
                   alsa-lib
                   (shika-cargo-inputs 'spotatui)))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'remove-patch-section
            (lambda _
              (substitute* "Cargo.toml"
                (("\\[patch\\.crates-io\\][\\s\\S]*" _)
                 "")))))))
    (home-page "https://github.com/LargeModGames/spotatui")
    (synopsis
     "A Spotify client for the terminal written in Rust, powered by Ratatui.")
    (description
     "A fully standalone Spotify client for the terminal. Native streaming included, no daemon required.")
    (license license:expat)))

spotatui
