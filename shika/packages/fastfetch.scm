;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages fastfetch)
  #:use-module (guix deprecation))

(define-deprecated/public-alias fastfetch-no-zfs
  (@ (shika packages admin) fastfetch-no-zfs))
