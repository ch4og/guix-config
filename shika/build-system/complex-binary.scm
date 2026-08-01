;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika build-system complex-binary)
  #:use-module (guix build-system)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix search-paths)
  #:use-module (guix store)
  #:use-module (guix monads)
  #:use-module (guix utils)
  #:use-module ((guix packages) #:prefix pkgs:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix modules)
  #:export (complex-binary-build-system
            %complex-binary-build-system-modules
            complex-binary-build))

(define %complex-binary-build-system-modules
  (cons '(shika build complex-binary-build-system)
        %copy-build-system-modules))

(define (default-glibc)
  (let ((base (resolve-interface '(gnu packages base))))
    (module-ref base 'glibc)))


(define* (lower name
                #:key source inputs native-inputs outputs system target
                #:allow-other-keys
                #:rest arguments)
  "Return a bag for NAME."
  (define private-keywords
    '(#:target #:inputs #:native-inputs))

  (bag
    (name name)
    (system system)
    (target target)
    (host-inputs `(,@(if source
                         `(("source" ,source))
                         '())
                   ,@inputs
                   ;; Automatically include glibc for the dynamic linker.
                   ,@`(("glibc" ,(default-glibc)))
                   ,@(if target
                         (standard-cross-packages target 'host)
                         '())
                   ,@(standard-packages)))
    (build-inputs native-inputs)
    (target-inputs (if target
                       (standard-cross-packages target 'target)
                       '()))
    (outputs outputs)
    (build complex-binary-build)
    (arguments (strip-keyword-arguments private-keywords arguments))))

(define* (complex-binary-build name inputs
                           #:key
                           guile source
                           (outputs '("out"))
                           (phases '(@ (shika build complex-binary-build-system)
                                     %standard-phases))
                           (search-paths '())
                           (install-plan ''(("." "./")))
                           (wrapper-plan ''())
                           (wrapper-mode 'dynamic-linker)
                           (out-of-source? #t)
                           (tests? #f)
                           (validate-runpath? #f)
                           (system (%current-system))
                           (imported-modules %complex-binary-build-system-modules)
                           (modules '((guix build gnu-build-system)
                                      (guix build copy-build-system)
                                      (guix build utils)
                                      (shika build complex-binary-build-system)))
                           (substitutable? #t)
                           #:allow-other-keys)
  "Build the given complex binary package, applying all of PHASES in order."
  (define builder
    (with-imported-modules imported-modules
      #~(begin
          (use-modules #$@(sexp->gexp modules))

          (complex-binary-build #:inputs #$(input-tuples->gexp inputs)
                            #:source #+source
                            #:system #$system
                            #:outputs #$(outputs->gexp outputs)
                            #:install-plan #$(if (pair? install-plan)
                                                 (sexp->gexp install-plan)
                                                 install-plan)
                            #:wrapper-plan #$(if (pair? wrapper-plan)
                                                 (sexp->gexp wrapper-plan)
                                                 wrapper-plan)
                            #:wrapper-mode '#$wrapper-mode
                            #:phases #$(if (pair? phases)
                                           (sexp->gexp phases)
                                           phases)
                            #:out-of-source? #$out-of-source?
                            #:tests? #$tests?
                            #:validate-runpath? #$validate-runpath?
                            #:search-paths '#$(sexp->gexp
                                               (map search-path-specification->sexp
                                                    search-paths))
                            #:substitutable? #$substitutable?))))

  (mlet %store-monad
      ((guile (pkgs:package->derivation (or guile
                                            (pkgs:default-guile))
                                        system
                                        #:graft? #f)))
    (gexp->derivation name
                      builder
                      #:system system
                      #:guile-for-build guile)))

(define complex-binary-build-system
  (build-system (name 'complex-binary)
                (description
                 "Build system for complex binary packages with optional ELF wrapping")
                (lower lower)))
