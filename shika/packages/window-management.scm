;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages window-management)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages window-management)
  #:use-module (gnu packages javascript)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xdisorg)
  #:use-module ((guix licenses) #:prefix license:))

(define-public mangowm
  (let ((base (@ (gnu packages window-management) mangowm))
        (version "0.16.1"))
    (package/inherit base
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/mangowm/mango")
                (commit version)))
         (file-name (git-file-name "mangowm" version))
         (sha256
          (base32
           "13a9zfd7crlpaihyxk42xcnl7fjnwajdd4j2j06f6rkjpbjgsrfj")))))))

(define-public mangowm-no-xwayland
  (package
    (inherit mangowm)
    (name "mangowm-no-xwayland")
    (arguments
     (substitute-keyword-arguments (package-arguments mangowm)
       ((#:configure-flags original-flags
         #~(list))
        #~(append #$original-flags
                  '("-Dxwayland=disabled")))))
    (inputs (modify-inputs (package-inputs mangowm)
              (delete "libxcb" "xcb-util-wm")))))

(define-public mangobar
  (package
    (name "mangobar")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/mangowm/mangobar")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17la38r0knhca9r4xxl6vf8y0g0msjyq66g9x6x8l5s0k9y2ywzg"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-basu
            (lambda _
              (substitute* "meson.build"
                (("libsystemd")
                 "basu"))
              (substitute* '("menu.h" "tray.c")
                (("systemd/sd-bus")
                 "basu/sd-bus")))))))
    (native-inputs (list pkg-config
                         python-minimal
                         wayland-protocols))
    (inputs (list alsa-lib
                  basu
                  cairo
                  cjson
                  eudev
                  fcft
                  gdk-pixbuf
                  pango
                  pixman
                  pulseaudio
                  wayland))
    (home-page "https://github.com/mangowm/mangobar")
    (synopsis "Wayland status bar for MangoWM")
    (description
     "A Wayland status bar for mangowm, built on wlr-layer-shell.")
    (license license:gpl3)))
