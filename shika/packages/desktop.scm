;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages desktop)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages suckless)
  #:use-module (shika utils cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public dmenu-bluetooth
  (let ((commit "96e2e3e1dd7ea2d2ab0c20bf21746aba8d70cc46"))
    (package
      (name "dmenu-bluetooth")
      (version (git-version "0.0.0" "0" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/Layerex/dmenu-bluetooth")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0qhssjs0jwk56wya1i8f32f9ysjrjaaj1kkn3q5rpz5xd9fqyvfh"))))
      (build-system copy-build-system)
      (arguments
       `(#:install-plan '(("dmenu-bluetooth" "bin/"))))
      (inputs (list bluez))
      (home-page "https://github.com/Layerex/dmenu-bluetooth")
      (synopsis
       "A dmenu menu that uses bluetoothctl to connect to bluetooth devices and display status.")
      (description
       "A script that generates a dmenu (or other) menu that uses bluetoothctl to connect to bluetooth devices and display status info.")
      (license license:gpl3))))

(define-public networkmanager-dmenu
  (package
    (name "networkmanager-dmenu")
    (version "2.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/firecat53/networkmanager-dmenu")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r57znpd3rkrm836jw2wb1fx82p724r85n8jb1chzi3p8qlhcf9m"))))
    (build-system copy-build-system)
    (inputs (list network-manager glib bash-minimal))
    (propagated-inputs (list python-wrapper python-pygobject))
    (arguments
     `(#:install-plan
       '(("networkmanager_dmenu" "bin/")
         ("networkmanager_dmenu.desktop" "share/applications/")
         ("README.md" "share/doc/networkmanager-dmenu/")
         ("config.ini.example" "share/doc/networkmanager-dmenu/"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'wrap-program
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (nm (assoc-ref inputs "network-manager"))
                    (binary (string-append out "/bin/networkmanager_dmenu"))
                    (nm-typelib (string-append nm "/lib/girepository-1.0")))
               (wrap-program binary
                 `("GI_TYPELIB_PATH" ":" prefix (,nm-typelib)))))))))
    (home-page "https://github.com/firecat53/networkmanager-dmenu")
    (synopsis "Control NetworkManager via dmenu")
    (description
     "Manage NetworkManager connections with supported launchers instead of nm-applet.")
    (license license:expat)))

(define-public hyperheadset
  (package
    (name "hyperheadset")
    (version "1.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/LennardKittner/HyperHeadset")
              (commit (string-append "v" version))
              (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0y3v6qfppa5qz7aa7y6swpm9r8xc56v8ldv8y3zw8h3hzbsm2x98"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #f
      #:features ''("eq-editor")
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
