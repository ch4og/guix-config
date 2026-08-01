;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages fastfetch)
  #:use-module (guix packages)
  #:use-module (gnu packages admin)
  #:use-module (shika utils override))

(define-public fastfetch-no-zfs
  (shika-override fastfetch-minimal
                  #:name "fastfetch-no-zfs"
                  #:commit (package-version fastfetch-minimal)
                  #:inputs (delete "zfs" (package-inputs fastfetch))))
fastfetch-no-zfs
