;;; SPDX-FileCopyrightText: 2024-2026 Murilo <murilo@disroot.org>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages osu)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system binary)
  #:use-module (gnu packages base)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages instrumentation)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (shika packages opentabletdriver)
  #:use-module ((guix licenses) #:prefix license:))

(define-public osu-lazer-bin
  (package
    (name "osu-lazer-bin")
    (version "2026.726.0-lazer")
    (source
      (origin
        (method url-fetch)
        (uri
          (string-append "https://github.com/ppy/osu/releases/download/"
                         version
                         "/osu.AppImage"))
        (sha256
          (base32 "18197gyldp59574mn95n018m2a2ryw1jcr80gc1zvps3jmh2hc1x"))))
    (build-system binary-build-system)
    (arguments
      (list #:validate-runpath? #f
            #:install-plan
            #~'(("usr/share/" "share/")
                ("usr/bin/" "lib/osu/")
                ("osu!.desktop" "share/applications/"))
            #:modules '((guix build utils)
                        (nonguix build binary-build-system)
                        (ice-9 format))
            #:phases
            #~(modify-phases %standard-phases
                (add-after 'binary-unpack 'remove-unused-files
                  (lambda _
                    (system* "7z" "x" "osu.AppImage")
                    (map delete-file '("usr/bin/UpdateNix"))))
                (add-after 'install 'wrap-program
                  (lambda _
                    (let* ((bin (string-append #$output "/lib/osu/osu!"))
                           (wrapper (string-append #$output "/bin/osu!")))
                      (mkdir-p (dirname wrapper))
                      (symlink bin wrapper)
                      (wrap-program wrapper
                        `("OSU_EXTERNAL_UPDATE_PROVIDER" = ("1"))
                        `("SDL_VIDEODRIVER" = ("wayland"))
                        `("LD_LIBRARY_PATH" prefix (,(string-append #$output "/lib/osu")
                                                     ,(string-append #$(this-package-input "mesa") "/lib")
                                                     ,(string-append #$(this-package-input "vulkan-loader") "/lib")
                                                     ,(string-append #$(this-package-input "libdrm") "/lib")
                                                     ,(string-append #$(this-package-input "wayland") "/lib")
                                                     ,(string-append #$(this-package-input "libxkbcommon") "/lib")
                                                     ,(string-append #$(this-package-input "libxcb") "/lib")
                                                     ,(string-append #$(this-package-input "libxext") "/lib")
                                                     ,(string-append #$(this-package-input "glib") "/lib")
                                                     ,(string-append #$(this-package-input "icu4c") "/lib")
                                                     ,(string-append #$(this-package-input "openssl") "/lib")
                                                     ,(string-append #$(this-package-input "alsa-lib") "/lib")
                                                     ,(string-append #$(this-package-input "dbus") "/lib")
                                                     ,(string-append #$(this-package-input "gcc-toolchain") "/lib")))))))
                (add-after 'wrap-program 'fix-so
                  (lambda _
                    (symlink (string-append #$(this-package-input "lttng-ust") "/lib/liblttng-ust.so")
                             (string-append #$output "/lib/osu/liblttng-ust.so.0"))
                    (symlink (string-append #$(this-package-input "eudev") "/lib/libudev.so.1.6.3")
                             (string-append #$output "/lib/osu/libudev.so.0"))))
                (add-after 'wrap-program 'patch-rpath
                  (lambda _
                    (let ((lib-osu (string-append #$output "/lib/osu"))
                          (zlib-lib (string-append #$(this-package-input "zlib") "/lib"))
                          (gcc-lib (string-append #$(this-package-input "gcc-toolchain") "/lib")))
                      (let ((rpath (string-join (list lib-osu zlib-lib gcc-lib) ":")))
                        (for-each
                         (lambda (lib)
                           (when (file-exists? lib)
                             (invoke "patchelf" "--set-rpath" rpath lib)))
                         (find-files lib-osu "\\.so"))
                        (let ((interpreter (car (find-files #$(this-package-input "glibc")
                                                            "ld-linux.*\\.so"))))
                          (invoke "patchelf" "--set-interpreter" interpreter
                                  "--set-rpath" rpath
                                  (string-append lib-osu "/osu!")))))))
                (add-after 'patch-rpath 'make-files-executable
                  (lambda _
                    (let* ((lib-osu (string-append #$output "/lib/osu")))
                      (map (lambda (file)
                             (chmod file #o555))
                           (cons* (string-append lib-osu "/osu!")
                                  (append (find-files lib-osu ".*\\.dll")
                                          (find-files lib-osu ".*\\.so.*")))))))
                (add-after 'make-files-executable 'install-udev-rules
                  (lambda _
                    (let* ((relative-rules.d "/lib/udev/rules.d")
                           (otd-rules (string-append #$(this-package-native-input "opentabletdriver-udev-rules")
                                                     relative-rules.d
                                                     "/70-opentabletdriver.rules"))
                           (rules.d (string-append #$output relative-rules.d)))
                      (install-file otd-rules rules.d)))))))
    (native-inputs (list 7zip patchelf opentabletdriver-udev-rules))
    (inputs
      (list alsa-lib
            dbus
            elfutils
            eudev
            gcc-toolchain
            glib
            glibc
            icu4c
            libdrm
            libxcb
            libxext
            libxkbcommon
            lttng-ust
            mesa
            openssl
            vulkan-loader
            wayland
            zlib))
    (home-page "https://osu.ppy.sh/")
    (synopsis "rhythm is just a *click* away!")
    (description "A free-to-win rhythm game. This is the future – and final
– iteration of the osu! game client which marks the beginning of an open era!
Currently known by and released under the release codename lazer. As in
sharper than cutting-edge.")
    (license license:expat)))
