;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

;;; OpenTabletDriver udev rules service.
;;;
;;; Examples:
;;;   (service opentabletdriver-udev-service-type)

(define-module (shika services opentabletdriver)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (guix utils)
  #:use-module (shika packages opentabletdriver)
  #:export (opentabletdriver-udev-service-type))


(define-public opentabletdriver-udev-service-type
  (service-type (name 'opentabletdriver-udev)
                (description
                 "OpenTabletDriver udev rules.")
                (extensions (list (service-extension udev-service-type
                                                     (list opentabletdriver-udev-rules))))
                (default-value #f)))
