;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

;;; System service to run WebHID-for-Firefox-Server as root.
;;;
;;; Example:
;;;   (service webhid-for-firefox-service-type)
;;;
;;;   (service webhid-for-firefox-service-type
;;;            (webhid-for-firefox-configuration
;;;             (token "my-secret-token")))

(define-module (shika services webhid-for-firefox)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (shika packages webhid-for-firefox)
  #:export (webhid-for-firefox-configuration
            webhid-for-firefox-configuration?
            webhid-for-firefox-service-type))

(define-record-type* <webhid-for-firefox-configuration>
  webhid-for-firefox-configuration make-webhid-for-firefox-configuration
  webhid-for-firefox-configuration?
  (token webhid-for-firefox-configuration-token
         (default #f)))

(define (webhid-for-firefox-shepherd-service config)
  (let ((token (webhid-for-firefox-configuration-token config)))
    (list (shepherd-service
           (documentation "Run WebHID-for-Firefox-Server.")
           (provision '(webhid-for-firefox))
           (requirement '(udev))
           (start #~(make-forkexec-constructor
                     (append
                      (list #$(file-append webhid-for-firefox
                                           "/bin/WebHID-for-Firefox-Server"))
                      #$(if token
                            #~(list "--token" #$token)
                            #~'()))))
           (stop #~(make-kill-destructor))))))

(define-public webhid-for-firefox-service-type
  (service-type (name 'webhid-for-firefox)
                (extensions (list (service-extension
                                   shepherd-root-service-type
                                   webhid-for-firefox-shepherd-service)))
                (default-value (webhid-for-firefox-configuration))
                (description
                 "Run WebHID-for-Firefox-Server as root for HID device access.")))
