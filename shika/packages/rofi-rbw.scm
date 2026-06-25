;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages rofi-rbw)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rofi-rbw
  (package
    (name "rofi-rbw")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rofi_rbw" version))
       (sha256
        (base32 "0wds4dzs5krh661ardyp69gwn34y5z7z4zy0j95cmjhyxjgxm9a5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-configargparse))
    (home-page "https://github.com/fdw/rofi-rbw")
    (synopsis "Rofi frontend for Bitwarden")
    (description
     "Based on the alternative Bitwarden CLI rbw and inspired by rofi-pass,
rbw-rofi is a simplistic password typer/copier using rofi, wofi, fuzzel, and bemenu.")
    (license license:expat)))

rofi-rbw
