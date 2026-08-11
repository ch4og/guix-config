;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build interpreter-binary-build-system)
  #:use-module ((guix build copy-build-system) #:prefix copy:)
  #:use-module (guix build utils)
  #:use-module (ice-9 match)
  #:use-module (shika build binary-utils)
  #:export (%standard-phases interpreter-binary-build))

(define* (patch-interpreters #:key inputs outputs wrapper-plan dynamic-linker
                             #:allow-other-keys)
  (let ((out (assoc-ref outputs "out")))
    (for-each
     (lambda (plan)
       (match plan
         ((binary _)
          (patch-binary-interpreter
           (string-append out "/" binary)
           #:inputs inputs
           #:dynamic-linker dynamic-linker))
         (_
          (error "interpreter-binary: invalid wrapper plan entry" plan))))
     wrapper-plan)))

(define* (interpreter-binary-build #:key inputs (phases %standard-phases)
                                   #:allow-other-keys #:rest args)
  "Build a binary after patching its ELF interpreter."
  (apply copy:copy-build #:inputs inputs #:phases phases args))

(define %standard-phases
  (modify-phases copy:%standard-phases
    (delete 'validate-runpath)
    (delete 'strip)
    (add-after 'install 'patch-interpreters patch-interpreters)
    (add-after 'patch-interpreters 'create-binary-wrapper wrap-binaries-direct)))
