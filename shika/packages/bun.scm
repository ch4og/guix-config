;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages bun)
  #:use-module (guix deprecation))

(define-deprecated/public-alias bun-bin
  (@ (shika packages development) bun-bin))

(define-deprecated/public-alias bun
  (@ (shika packages development) bun))
