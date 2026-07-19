;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages waybar)
  #:use-module (gnu packages window-management)
  #:use-module (shika utils override))

(define-public waybar-experimental-git
  (shika-override waybar
                  #:name "waybar-experimental-git"
                  #:commit "7f732f055316d3b0ab89f57e4347d24c1cc96167"
                  #:hash "06ry0n118a41dy1lbb2y558nc2ahrsz4s9mwhz0f6b9fcd4mwanh"))

waybar-experimental-git
