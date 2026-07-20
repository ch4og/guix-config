;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages kmscon)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages terminals)
  #:use-module (shika utils override))

(define libtsm-guix
  (@ (gnu packages terminals) libtsm))

(define kmscon-guix
  (@ (gnu packages terminals) kmscon))

(define libtsm-shika
  (shika-override libtsm-guix
                  #:version "4.6.0"
                  #:hash "0lrmdaqlaq97slwi4n99m4lr3b71vzq0xck8i3kbnzdw92v69ph8"))

(define-public kmscon
  (shika-override kmscon-guix
                  #:version "10.0.1"
                  #:hash "162nxqrlsvsdf6pypqdd3s54ac3c6vfnchfk8dmmy4nzlj5acm5y"
                  #:inputs (modify-inputs (package-inputs kmscon-guix)
                             (replace "libtsm" libtsm-shika))))

kmscon
