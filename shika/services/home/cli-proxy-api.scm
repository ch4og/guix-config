;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Home service to run cli-proxy-api
;;;
;;; Examples:
;;;   (service home-cli-proxy-api-service-type)
;;;
;;;   (service home-cli-proxy-api-service-type
;;;            (home-cli-proxy-api-configuration
;;;             (config (local-file "./config.json"))))

(define-module (shika services home cli-proxy-api)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (shika packages ai)
  #:export (home-cli-proxy-api-configuration
            home-cli-proxy-api-configuration?
            home-cli-proxy-api-configuration-config
            home-cli-proxy-api-configuration-package
            home-cli-proxy-api-service-type))

(define-record-type* <home-cli-proxy-api-configuration>
  home-cli-proxy-api-configuration make-home-cli-proxy-api-configuration
  home-cli-proxy-api-configuration?
  (package home-cli-proxy-api-configuration-package
           (default cli-proxy-api))
  (config home-cli-proxy-api-configuration-config
          (default #f)))

(define (home-cli-proxy-api-shepherd-service config)
  (let ((package (home-cli-proxy-api-configuration-package config))
        (config-file (home-cli-proxy-api-configuration-config config)))
    (list (shepherd-service
           (documentation "cli-proxy-api")
           (provision '(cli-proxy-api))
           (start #~(make-forkexec-constructor
                     (append
                      (list #$(file-append package "/bin/cli-proxy-api"))
                      #$(if config-file
                            #~(list "-config" #$config-file)
                            #~()))))
           (stop #~(make-kill-destructor))))))

(define home-cli-proxy-api-service-type
  (service-type (name 'home-cli-proxy-api)
                (description
                 "Run cli-proxy-api, a unified proxy for AI APIs.")
                (extensions (list (service-extension
                                   home-shepherd-service-type
                                   home-cli-proxy-api-shepherd-service)))
                (default-value (home-cli-proxy-api-configuration))))
