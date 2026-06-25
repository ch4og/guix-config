;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages wakatime)
  #:use-module (guix packages)
  #:use-module (shika build-system nix-go)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages skarnet)
  #:use-module ((guix licenses) #:prefix license:))

(define-public wakatime-cli
  (package
    (name "wakatime-cli")
    (version "2.21.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/wakatime/wakatime-cli")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zav3y2940mkr3yli86yik6kk8iq0w6q4y0vw3vkyfzpy04mmdis"))))
    (build-system nix-go-build-system)
    (native-inputs (list bats execline perl python))
    (arguments
     `(#:vendor-hash "0vxrk1hfmxg4kfqslss83xbxrd7nmivzgdpanqbmy157gz029mqq"
       #:go ,go-1.26
       #:ldflags `("-X" ,(string-append "github.com/wakatime/wakatime-cli"
                                        "/pkg/version.Version=" ,version))))
    (home-page "https://github.com/wakatime/wakatime-cli")
    (synopsis "CLI for WakaTime")
    (description
     "Command line interface to WakaTime used by all WakaTime text editor plugins.")
    (license license:bsd-3)))

wakatime-cli
