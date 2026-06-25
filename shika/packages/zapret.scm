;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages zapret)
  #:use-module (guix packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public zapret
  (package
    (name "zapret")
    (version "72.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/bol-van/zapret")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nhcaa8m96clqs99fvqfdsq8005wglfdfg723y6adfpvbbidzb2v"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'create-cc-symlink
            (lambda _
              (let ((gcc (which "gcc")))
                (when gcc
                  (symlink gcc "cc")
                  (setenv "PATH"
                          (string-append (getcwd) ":" (getenv "PATH")))))))
          (delete 'configure)
          (delete 'check)
          (replace 'install
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (install-file "binaries/my/tpws" bin)
                (install-file "binaries/my/nfqws" bin)
                (install-file "binaries/my/ip2net" bin)
                (install-file "binaries/my/mdig" bin)
                (for-each (lambda (file)
                            (chmod file #o755))
                          (find-files bin))))))))
    (native-inputs (list pkg-config gcc-toolchain))
    (inputs (list openssl
                  zlib
                  libmnl
                  libnetfilter-queue
                  libnfnetlink
                  libcap))
    (home-page "https://github.com/bol-van/zapret")
    (synopsis "DPI bypass multi platform tool")
    (description
     "Autonomous countermeasure against DPI")
    (license license:expat)))

zapret
