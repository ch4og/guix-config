;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages hyperheadset)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (shika utils cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public hyperheadset
  (package
    (name "hyperheadset")
    (version "1.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/LennardKittner/HyperHeadset")
              (commit (string-append "v" version))
              (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "160p7hfshl4w98qd0ks3awd6fsxj99nwlwpa8fz2cirw8nmfpvac"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-extras
            (lambda* _
              (let ((share (string-append #$output "/share")))
                (mkdir-p (string-append share "/applications"))
                (copy-file "hyper-headset.desktop"
                           (string-append share "/applications/hyper-headset.desktop"))))))))
    (native-inputs (list pkg-config))
    (inputs (cons* dbus
                   eudev
                   (shika-cargo-inputs 'hyperheadset)))
    (home-page "https://github.com/LennardKittner/HyperHeadset")
    (synopsis "Application for monitoring and managing HyperX headsets.")
    (description
     "A CLI and tray application for monitoring and managing HyperX headsets.")
    (license license:expat)))

(define-public hyperheadset-udev-rules
  (package
    (inherit hyperheadset)
    (name "hyperheadset-udev-rules")
    (build-system copy-build-system)
    (arguments
     `(#:install-plan '(("99-HyperHeadset.rules" "lib/udev/rules.d/"))))
    (synopsis "UDev rules for HyperHeadset")
    (description "UDev rules granting permissions for HyperX headsets.")))
