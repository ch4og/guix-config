;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages waypaper)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (gnu packages check)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:))

(define python-screeninfo
  (package
    (name "python-screeninfo")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri ((@ (guix build-system pyproject) pypi-uri) "screeninfo" version))
       (sha256
        (base32 "1l9frlckb9zbwx5kngxv5byi353jyfmpskcy38m40d3yrimhg0wr"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f)) ;Tests do not exist.
    (native-inputs (list python-poetry-core))
    (home-page "https://github.com/rr-/screeninfo")
    (synopsis "Fetch location and size of physical screens.")
    (description synopsis)
    (license license:expat)))

(define-public waypaper
  (package
    (name "waypaper")
    (version "2.8")
    (source
     (origin
       (method url-fetch)
       (uri ((@ (guix build-system pyproject) pypi-uri) name version))
       (sha256
        (base32 "14gq3ln631q0f5gzdmy1i2bld0bx5av9p6am8z88ij1in9xas61x"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f ;Tests do not exist.
      #:imported-modules `((guix build glib-or-gtk-build-system)
                           ,@%pyproject-build-system-modules)
      #:modules '((guix build pyproject-build-system)
                  (guix build utils)
                  ((guix build glib-or-gtk-build-system) #:prefix gtk:))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check) ;Won't work and not needed for GUI app.
          (add-after 'wrap 'glib-or-gtk-wrap
            (assoc-ref gtk:%standard-phases 'glib-or-gtk-wrap))
          (add-after 'wrap 'wrap-gi
            (lambda _
              (let* ((waypaper (string-append #$output "/bin/waypaper"))
                     (gtk+ #$(this-package-input "gtk+"))
                     (gtk+_gi (string-append gtk+ "/lib/girepository-1.0")))
                (wrap-program waypaper
                  `("GI_TYPELIB_PATH" ":" prefix (,gtk+_gi)))))))))
    (native-inputs (list python-setuptools))
    (inputs (list gdk-pixbuf
                  gtk+
                  python-imageio
                  python-imageio-ffmpeg
                  python-platformdirs
                  python-pygobject-3.50
                  python-screeninfo))
    (home-page "https://anufrievroman.gitbook.io/waypaper")
    (synopsis "GUI wallpaper manager for Wayland and Xorg Linux systems")
    (description
     "GUI wallpaper setter for Wayland and Xorg window managers.
It works as a frontend for popular wallpaper backends like swaybg, awww,
swww, wallutils, hyprpaper, mpvpaper, xwallpaper and feh.")
    (license license:gpl3)))

waypaper
