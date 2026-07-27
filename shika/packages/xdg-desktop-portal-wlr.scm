;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages xdg-desktop-portal-wlr)
  #:use-module (gnu packages window-management)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages)
  #:use-module (shika utils override))

(define-public xdg-desktop-portal-wlr-funk443
  (shika-override xdg-desktop-portal-wlr
                  #:name "xdg-desktop-portal-wlr-funk443"
                  #:url "https://github.com/funk443/xdg-desktop-portal-wlr"
                  #:commit "74be7063347880f6bf98689e24dd9a6e98032405"
                  #:hash "125rsvls0gyc7a0lspvrqm54ckplfvd18q963yfmq47d6n3im6gr"
                  #:patches (search-patches "xdg-desktop-portal-wlr-harcoded-length.patch")))

xdg-desktop-portal-wlr-funk443
