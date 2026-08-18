;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages corepack)
  #:use-module (guix deprecation))

(define-deprecated/public-alias corepack-yarn
  (@ (shika packages development) corepack-yarn))

(define-deprecated/public-alias corepack-pnpm
  (@ (shika packages development) corepack-pnpm))
