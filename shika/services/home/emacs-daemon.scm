;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Home service to launch Emacs daemon
;;;
;;; Examples:
;;;   (service home-emacs-daemon-service-type)
;;;
;;;   (service home-emacs-daemon-service-type
;;;            (home-emacs-daemon-configuration
;;;             (emacs (specification->package "emacs-pgtk"))))

(define-module (shika services home emacs-daemon)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix records)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages emacs)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:export (home-emacs-daemon-configuration
            home-emacs-daemon-configuration?
            home-emacs-daemon-configuration-emacs
            home-emacs-daemon-service-type))

(define-record-type* <home-emacs-daemon-configuration>
  home-emacs-daemon-configuration make-home-emacs-daemon-configuration
  home-emacs-daemon-configuration?
  (emacs home-emacs-daemon-configuration-emacs
         (default emacs)))

(define (home-emacs-daemon-shepherd-service config)
  (let ((emacs (home-emacs-daemon-configuration-emacs config)))
    (list (shepherd-service (documentation "Emacs daemon")
                            (provision '(home-emacs-daemon))
                            (start #~(make-forkexec-constructor (list #$(file-append emacs "/bin/emacs")
                                                                      "--fg-daemon")))
                            (stop #~(make-kill-destructor))))))

(define home-emacs-daemon-service-type
  (service-type (name 'home-emacs-daemon)
                (description
                 "Run Emacs daemon.")
                (extensions (list (service-extension
                                   home-shepherd-service-type
                                   home-emacs-daemon-shepherd-service)))
                (default-value (home-emacs-daemon-configuration))))
