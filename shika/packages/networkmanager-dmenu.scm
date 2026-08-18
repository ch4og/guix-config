;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages networkmanager-dmenu)
  #:use-module (guix deprecation))

(define-deprecated/public-alias networkmanager-dmenu
  (@ (shika packages desktop) networkmanager-dmenu))
