;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages discord)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages linux)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (shika build-system complex-binary)
  #:use-module (nonguix build-system chromium-binary))

(define-public arrpc-bun
  (package
    (name "arrpc-bun")
    (version "1.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://github.com/Creationsss/arrpc-bun/"
                            "releases/download/"
                            "v" version "/"
                            "arrpc-bun-linux-x64"))
        (sha256
          (base32 "1cviswj5b1gack8nx5xrxmv02x49wkn65pr45g3gxpqb88kdh6yw"))))
    ;; This binary cannot be patched.  We use Guix ld wrapping approach.
    (build-system complex-binary-build-system)
    (arguments
     (list #:install-plan
           #~'(("arrpc-bun-linux-x64" "bin/arrpc"))
           #:wrapper-plan
           #~'(("bin/arrpc" ".arrpc-real"))))
    (synopsis "Discord RPC server rewritten in TypeScript with Bun")
    (description
     "arrpc-bun is a TypeScript and Bun rewrite of arRPC by OpenAsar.
It implements Discord's local RPC servers for Rich Presence support.")
    (home-page "https://github.com/Creationsss/arrpc-bun")
    (license license:expat)))

(define-public equibop
  (package
    (name "equibop")
    (version "3.2.1")
    (source
      (origin
        (method url-fetch)
        (uri
          (string-append "https://github.com/Equicord/Equibop/"
                         "releases/download/"
                         "v" version "/"
                         name "_" version "_amd64.deb"))
        (sha256
          (base32 "115gifvgwj9crhik9d3bi8vmh5zxczv6rajjsllm5q2b6qz76n01"))))
    (build-system chromium-binary-build-system)
    (inputs (list arrpc-bun pipewire))
    (arguments
     (list #:validate-runpath? #f
           #:imported-modules `((guix build glib-or-gtk-build-system)
                                ,@%chromium-binary-build-system-modules)
           #:modules '((nonguix build chromium-binary-build-system)
                       (guix build utils)
                       (nonguix build utils)
                       ((guix build glib-or-gtk-build-system) #:prefix gtk:))
           #:wrapper-plan
           #~'(("opt/Equibop/equibop"
               (("nss" "/lib/nss")
                ("out" "/opt/Equibop"))))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'binary-unpack 'setup-cwd
                 (lambda _
                   (copy-recursively "usr/" ".")
                   (delete-file-recursively "usr")
                   (delete-file "control.tar.xz")
                   (substitute* '("share/applications/equibop.desktop")
                     (("/opt/Equibop/")
                      (string-append #$output "/bin/")))))
               ;; Since we use prebuilt binary we should patch ASAR
               (add-after 'setup-cwd 'disable-auto-updates
                 (lambda _
                   (let* ((app-asar "opt/Equibop/resources/app.asar")
                          (sed-asar
                           (lambda (one two)
                             (let ((one-length (string-length one))
                                   (two-length (string-length two)))
                               (unless (> one-length two-length)
                                 (error "Too long replacement: ~s -> ~s"
                                        one two))
                               (invoke "sed" "-i"
                                       (string-append
                                        "s|" one "|"
                                        two
                                        (make-string (- one-length two-length) #\space)
                                        "|")
                                       app-asar)))))
                     (sed-asar
                      "Et.autoUpdater.checkForUpdates().then(e=>!!e?.isUpdateAvailable)"
                      "false")
                     (sed-asar
                      "await Et.autoUpdater.checkForUpdates()"
                      "await 0"))))
               ;; Equibop bundles arrpc-bun which will not work due to linkage.
               (add-after 'disable-auto-updates 'replace-arrpc
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let* ((arrpc-dir "opt/Equibop/resources/arrpc")
                          (arrpc-lib (assoc-ref inputs "arrpc-bun"))
                          (arrpc-bin (string-append arrpc-lib "/bin/arrpc")))
                     (delete-file (string-append arrpc-dir "/arrpc"))
                     (symlink arrpc-bin (string-append arrpc-dir "/arrpc")))))
               (add-after 'install 'symlink-binary-file
                 (lambda _
                   (mkdir-p (string-append #$output "/bin"))
                   (symlink (string-append #$output "/opt/Equibop/equibop")
                            (string-append #$output "/bin/equibop"))))
               ;; Required to make xdg-open work.  Build system sets it.
               (add-after 'install-wrapper 'remove-ld-path
                 (lambda _
                   (invoke "sed" "-i"
                           "s/^export LD_LIBRARY_PATH=.*$//"
                           (string-append #$output "/bin/equibop"))))
               (add-after 'remove-ld-path 'glib-or-gtk-wrap
                 (assoc-ref gtk:%standard-phases 'glib-or-gtk-wrap))
               (add-after 'glib-or-gtk-wrap 'wrap-venmic-libraries
                 (lambda* (#:key inputs #:allow-other-keys)
                   (wrap-program (string-append #$output "/bin/equibop")
                     `("LD_LIBRARY_PATH" ":" prefix
                       (,(string-append (assoc-ref inputs "pulseaudio") "/lib")
                        ,(string-append (assoc-ref inputs "pipewire") "/lib")
                        ,(string-append (assoc-ref inputs "gcc") "/lib")))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Custom Discord App aiming to give you better performance and improve linux support")
    (description
     "Equibop is a custom Discord App aiming to give you better performance
and improve linux support.  It is a fork of Vesktop.")
    (home-page "https://github.com/Equicord/Equibop")
    (license license:gpl3)))
