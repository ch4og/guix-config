;;; SPDX-FileCopyrightText: 2025 Hilton Chain <hako@ultrarare.space>
;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages rust-sources)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (shika utils cargo)
  #:use-module (guix download))

(define-public rust-librespot-0.8.0.28bcb23
  (let ((commit "28bcb231fe26f4db682eb85d1f7ae43aa1a83896")
        (revision "0"))
    (hidden-package
     (package
       (name "rust-librespot")
       (version (git-version "0.8.0" revision commit))
       (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/LargeModGames/spotatui-librespot")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
           (base32 "0ph5gh9jg5w6q3c1nlp86jyw8xrg55crzqhd4w310byj8xpw1s2r"))))
       (build-system cargo-build-system)
       (arguments
        (list #:skip-build? #t
             ;;; Order of crates DO matter!
              #:cargo-package-crates
              ''("librespot-oauth"
                 "librespot-protocol"
                 "librespot-core"
                 "librespot-audio"
                 "librespot-metadata"
                 "librespot-playback"
                 "librespot-connect")))
       (inputs
        (shika-cargo-inputs 'rust-librespot-0.8.0.28bcb23))
       (home-page "https://github.com/LargeModGames/spotatui-librespot")
       (synopsis "Open Source Spotify client library")
       (description
        "librespot is an open source client library for Spotify. It enables
applications to use Spotify's service to control and play music via various
backends, and to act as a Spotify Connect receiver.")
       (license license:expat)))))
