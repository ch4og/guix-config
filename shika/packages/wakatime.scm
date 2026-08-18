;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages wakatime)
  #:use-module (guix deprecation))

(define-deprecated/public-alias wakatime-cli
  (@ (shika packages development) wakatime-cli))
