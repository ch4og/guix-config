;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages throne)
  #:use-module (guix packages)
  #:use-module (shika build-system nix-go)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages protobuf)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages linux))

(define-public throne-core
  (package
    (name "throne-core")
    (version "1.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/throneproj/throne")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1727vf87ggv148v0ryx7n18dfgxy1nx9kiazni0760i9dr81cd5b"))
       (patches (list (local-file (string-append (dirname (current-filename))
                                   "/../patches/throne/core-also-check-capabilities.patch"))))
       (snippet '(begin
                   (use-modules (guix build utils))
                   (copy-recursively "core/server" ".")))))
    (build-system nix-go-build-system)
    (native-inputs (list protoc-gen-go
                         protobuf))
    (arguments
     `(#:vendor-hash "1111vwc3b95d9i0ld42n64w3r6bfpyi22b345qm8zn0mqs8bz2aa"
       #:ldflags (list "-w" "-s"
                       "-X" ,(string-append
                              "github.com/sagernet/sing-box/constant.Version="
                              version))
       #:tags '("with_clash_api"
                "with_gvisor"
                "with_quic"
                "with_wireguard"
                "with_utls"
                "with_dhcp"
                "with_tailscale")))
    (home-page "https://github.com/throneproj/Throne")
    (synopsis "Cross-platform GUI proxy utility")
    (description "Qt based Desktop cross-platform GUI proxy utility, empowered by Sing-box")
    (license license:gpl3+)))

;;;(define-public throne
;;;  (package
;;;    (inherit nekobox-core)
;;;    (name "throne")
;;;    (build-system cmake-build-system)
;;;    (native-inputs (list qtbase qttools protobuf nekobox-core))
;;;    (arguments
;;;     '(#:tests? #f
;;;       #:configure-flags '("-DNKR_PACKAGE=ON")
;;;       #:phases (modify-phases %standard-phases
;;;                  (replace 'install
;;;                    (lambda* (#:key outputs inputs #:allow-other-keys)
;;;                      (let* ((out (assoc-ref outputs "out"))
;;;                             (core (assoc-ref inputs "nekobox-core")))
;;;                        (mkdir-p (string-append out "/bin"))
;;;                        (copy-file "throne"
;;;                                   (string-append out "/bin/throne"))
;;;                        (copy-file (string-append core "/bin/nekobox_core")
;;;                                   (string-append out "/bin/nekobox_core"))))))))))
;;;
;;;throne
