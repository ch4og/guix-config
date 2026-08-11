;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build ld-binary-build-system)
  #:use-module ((guix build copy-build-system) #:prefix copy:)
  #:use-module (guix build utils)
  #:use-module (shika build binary-utils)
  #:export (%standard-phases ld-binary-build))

(define* (ld-binary-build #:key inputs (phases %standard-phases)
                           #:allow-other-keys #:rest args)
  "Build an unpatchable binary and wrap it with Guix's dynamic linker."
  (apply copy:copy-build #:inputs inputs #:phases phases args))

(define %standard-phases
  (modify-phases copy:%standard-phases
    (delete 'validate-runpath)
    (delete 'strip)
    (add-after 'install 'create-binary-wrapper wrap-binaries-with-ld)))
