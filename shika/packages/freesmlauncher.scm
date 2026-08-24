;;; SPDX-FileCopyrightText: 2019 Jelle Licht <jlicht@fsfe.org>
;;; SPDX-FileCopyrightText: 2019 Alex Griffin <a@ajgrf.com>
;;; SPDX-FileCopyrightText: 2021 Pierre Langlois <pierre.langlois@gmx.com>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages freesmlauncher)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) :prefix license:))

(define freesm-java-runtimes
  (list `(,openjdk17 "jdk")
        `(,openjdk21 "jdk")
        `(,openjdk25 "jdk")))

(define-public freesmlauncher
  (package
    (name "freesmlauncher")
    (version "2.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/FreesmTeam/FreesmLauncher")
                     (recursive? #t)
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1m4hvqy6masvkp3fr2m6km25xmf8lywyhkdfbkis1qwnihpclsz8"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_CXX_FLAGS=-Wno-array-bounds"
              "-DLauncher_BUILD_PLATFORM=ch4og/shikanox Guix channel"
              "-DLauncher_QT_VERSION_MAJOR=6")
      ;; -Wno-array-bounds silences a false positive
      ;; TODO: drop once https://github.com/PrismLauncher/PrismLauncher/pull/5807 is merged
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((bin (string-append #$output "/bin/freesmlauncher"))
                     (xrandr (assoc-ref inputs "xrandr"))
                     (yad (assoc-ref inputs "yad"))
                     (pciutils (assoc-ref inputs "pciutils"))
                     (qtbase (assoc-ref inputs "qtbase"))
                     (qtwayland (assoc-ref inputs "qtwayland"))
                     (qtsvg (assoc-ref inputs "qtsvg"))
                     (java-name #$(package-name (caar freesm-java-runtimes)))
                     (java-paths
                      (map (lambda (input)
                             (string-append (cdr input) "/bin/java"))
                           (filter (lambda (input)
                                     (string=? (car input) java-name))
                                   inputs))))
                (wrap-program bin
                  `("FREESMLAUNCHER_JAVA_PATHS" ":" prefix ,java-paths)
                  `("PATH" ":" prefix (,(string-append xrandr "/bin")
                                           ,(string-append yad "/bin")
                                           ,(string-append pciutils "/bin")))
                  `("QT_PLUGIN_PATH" ":" prefix ,(map (lambda (package)
                                                        (string-append package "/lib/qt6/plugins"))
                                                      (list qtbase qtwayland qtsvg)))
                  `("LD_LIBRARY_PATH" ":" prefix
                    (,@(map (lambda (dep)
                              (string-append (assoc-ref inputs dep) "/lib"))
                            '("alsa-lib" "eudev" "flite" "gamemode" "jack2" "libglvnd"
                              "libusb" "libx11" "libxext" "libxcursor" "libxkbcommon" "libxrandr"
                              "libxxf86vm" "mesa" "openal" "pipewire" "pulseaudio" "vulkan-loader"))))) ))))))
    (native-inputs
     (list extra-cmake-modules
           pkg-config))
    (inputs
     (cons* bash-minimal
            alsa-lib
            cmark
            eudev
            flite
            gamemode
            jack-2
            libarchive
            libglvnd
            libusb
            libx11
            libxcursor
            libxext
            libxkbcommon
            libxrandr
            libxxf86vm
            mesa
            openal
            pciutils
            pipewire
            pulseaudio
            qrencode
            qt5compat
            qtbase
            qtnetworkauth
            qtsvg
            qtwayland
            tomlplusplus
            vulkan-loader
            xrandr
            yad
            zlib
            freesm-java-runtimes))
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
                   license:asl2.0))))    ; classparser, systeminfo
