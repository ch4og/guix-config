;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages protonplus)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module ((guix licenses) #:prefix license:))

(define-public protonplus
  (package
    (name "protonplus")
    (version "0.5.21")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Vysp3r/protonplus")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "10aciihwf4y70pc4syc7356jrl9bg4zf6mh6diwksc926223cmvs"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t))
    (native-inputs (list gettext-minimal
                         `(,glib "bin")
                         pkg-config
                         vala))
    (inputs (list desktop-file-utils
                  gsettings-desktop-schemas
                  `(,gtk "bin")
                  json-glib
                  libadwaita
                  libarchive
                  libgee
                  libsoup))
    (home-page "https://github.com/Vysp3r/protonplus")
    (synopsis "Simple Wine and Proton-based compatibility tools manager.")
    (description
     "ProtonPlus is a Proton version manager for installing and managing Proton versions.
It works with Steam, Lutris, Heroic Games Launcher and Bottles. It uses GTK4.")
    (license license:gpl3)))

(define-public protonplus-sandbox
  (package
    (inherit protonplus)
    (name "protonplus-sandbox")
    (arguments
     (list
      #:glib-or-gtk? #t
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'set-home
            (lambda _
              (let* ((bin (string-append #$output "/bin/protonplus"))
                     (new-home "$HOME/.local/share/guix-sandbox-home/")
                     (prefix (string-append "${GUIX_SANDBOX_HOME:-" new-home "}")))
                (wrap-program bin
                  `("HOME" = (,(prefix)))
                  `("XDG_DATA_HOME" = (,(string-append prefix "/.local/share")))
                  `("XDG_CONFIG_HOME" = (,(string-append prefix "/.config"))))))))))
    (synopsis "Simple Wine and Proton-based compatibility tools manager.
Patched for nonguix container path.")))

protonplus
