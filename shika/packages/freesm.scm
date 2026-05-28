;;; SPDX-FileCopyrightText: 2019 Jelle Licht <jlicht@fsfe.org>
;;; SPDX-FileCopyrightText: 2019 Alex Griffin <a@ajgrf.com>
;;; SPDX-FileCopyrightText: 2021 Pierre Langlois <pierre.langlois@gmx.com>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages freesm)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) :prefix license:)
  #:use-module ((nonguix licenses) :prefix non-license:))

(define-public freesmlauncher
  (package
    (name "freesmlauncher")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/FreesmTeam/FreesmLauncher")
                     (recursive? #t)
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1hswz28iz0y12i78ys1a8f74pav45imsi26h0jrsakdvav98nscn"))))
    (build-system cmake-build-system)
    (arguments
     (list
        #:phases
       #~(modify-phases %standard-phases
         (add-after 'install 'patch-paths
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((bin (string-append #$output "/bin/freesmlauncher"))
                    (xrandr (assoc-ref inputs "xrandr"))
                    (qtwayland (assoc-ref inputs "qtwayland"))
                    (qtsvg (assoc-ref inputs "qtsvg")))
               (wrap-program bin
                 `("PATH" ":" prefix (,(string-append xrandr "/bin")))
                 `("QT_PLUGIN_PATH" ":" prefix ,(map (lambda (package)
                                                       (string-append package "/lib/qt6/plugins"))
                                                     (list qtwayland qtsvg)))
                 `("LD_LIBRARY_PATH" ":" prefix
                   (,@(map (lambda (dep)
                             (string-append (assoc-ref inputs dep) "/lib"))
                           '("libx11" "libxext" "libxcursor" "libxkbcommon" "flite"
                             "libxrandr" "libxxf86vm" "pulseaudio" "mesa")))))
               #t))))))
    (native-inputs
     (list extra-cmake-modules
           gamemode
           pkg-config))
    (inputs
     (list bash-minimal ; for wrap-program
           cmark
           flite
           libarchive
           libx11
           libxcursor
           libxext
           libxkbcommon
           libxrandr
           libxxf86vm
           mesa
           pulseaudio
           qrencode
           qt5compat
           qtbase
           qtnetworkauth
           qtsvg
           qtwayland
           tomlplusplus
           xrandr
           zlib
           `(,openjdk17 "jdk")))
    (home-page "https://freesmlauncher.org/")
    (synopsis "A Prism Launcher fork aimed to provide a free way to play Minecraft")
    (description
     "Custom launcher for Minecraft that allows you to play
with offline account without any restrictions.")
    (license (list license:gpl3          ; PolyMC, launcher
                   license:expat         ; MinGW runtime, lionshead, tomlc99
                   license:lgpl3         ; Qt 5/6
                   license:lgpl3+        ; libnbt++
                   license:lgpl2.1+      ; rainbow (KGuiAddons)
                   license:isc           ; Hoedown
                   license:silofl1.1     ; Material Design Icons
                   license:lgpl2.1       ; Quazip
                   license:public-domain ; xz-minidec, murmur2, xz-embedded
                   license:bsd-3         ; ColumnResizer, O2 (Katabasis fork),
                                         ; gamemode, localpeer
                   license:asl2.0        ; classparser, systeminfo
                   ;; Batch icon set:
                   (non-license:nonfree "file://COPYING.md")))))
