;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages window-management)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages window-management))

(define mangowm-guix
  (@ (gnu packages window-management) mangowm))

(define-public mangowm
  (package
    (inherit mangowm-guix)
    (name "mangowm")
    (version "0.15.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/mangowm/mango")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "07xa4jc51rhbjjp0qjgbwwqgg02399x02b8fngxpss9aq5z7r6bz"))))
    (inputs (modify-inputs (package-inputs mangowm-guix)
              (prepend pango)
              (replace "wlroots" wlroots-0.20)
              (replace "scenefx" scenefx-0.5)))))

(define scenefx-0.5
  (package
    (inherit scenefx)
    (name "scenefx")
    (version "0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/wlrfx/scenefx")
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0klxy73125lp9jab8qghh4v6di91l3y2rgan4m4lhv5flwdwnj5x"))))
    (inputs (modify-inputs (package-inputs scenefx)
              (replace "wlroots" wlroots-0.20)))))
