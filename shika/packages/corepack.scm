;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages corepack)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages node)
  #:use-module ((guix licenses) #:prefix license:))

(define (corepack-wrapper tool extra-tools lic)
  (package
    (name (string-append "corepack-" tool))
    (version (package-version node-lts))
    (source #f)
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'unpack)
          (delete 'configure)
          (delete 'build)
          (delete 'check)
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (bash (search-input-file inputs "bin/bash"))
                     (node-dir (assoc-ref inputs "node"))
                     (node-bin (string-append node-dir "/bin/node"))
                     (corepack (string-append node-dir "/lib/node_modules/corepack/dist/corepack.js"))
                     (tools (cons #$tool '#$extra-tools)))
                (mkdir-p bin)
                (for-each
                 (lambda (t)
                   (call-with-output-file (string-append bin "/" t)
                     (lambda (port)
                       (format port "#!~a~%exec ~a ~a ~a \"$@\"~%"
                               bash node-bin corepack t)))
                   (chmod (string-append bin "/" t) #o755))
                 tools)))))))
    (inputs (list bash-minimal node-lts))
    (home-page "https://github.com/nodejs/corepack")
    (synopsis (string-append tool " via corepack"))
    (description (string-append tool " package manager via corepack."))
    (license lic)))

(define-public corepack-yarn
  (corepack-wrapper "yarn" '("yarnpkg") license:bsd-2))

(define-public corepack-pnpm
  (corepack-wrapper "pnpm" '("pnpx") license:expat))

(list corepack-yarn corepack-pnpm)
