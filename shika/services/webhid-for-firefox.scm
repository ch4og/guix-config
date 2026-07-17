;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

;;; System service to run WebHID-for-Firefox-Server as root.
;;;
;;; Example:
;;;   (service webhid-for-firefox-service-type)

(define-module (shika services webhid-for-firefox)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (shika packages webhid-for-firefox)
  #:export (webhid-for-firefox-service-type))

(define (webhid-for-firefox-shepherd-service config)
  (list (shepherd-service
         (documentation "Run WebHID-for-Firefox-Server.")
         (provision '(webhid-for-firefox))
         (requirement '(udev))
         (start #~(make-forkexec-constructor
                   (list #$(file-append webhid-for-firefox
                                        "/bin/WebHID-for-Firefox-Server"))))
         (stop #~(make-kill-destructor)))))

(define-public webhid-for-firefox-service-type
  (service-type (name 'webhid-for-firefox)
                (extensions (list (service-extension
                                   shepherd-root-service-type
                                   webhid-for-firefox-shepherd-service)))
                (default-value #f)
                (description
                 "Run WebHID-for-Firefox-Server as root for HID device access.")))
