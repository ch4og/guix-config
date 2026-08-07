;;; SPDX-FileCopyrightText: 2026 Franz Geffke <mail@gofranz.com>
;;; SPDX-FileCopyrightText: 2026 Andrew Tropin <andrew@trop.in>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages ai)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (shika build-system nix-go)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages xorg)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonlicense:))

(define-public opencode-bin
  (package
    (name "opencode-bin")
    (version "1.17.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/anomalyco/opencode/"
                           "releases/download/v" version
                           "/opencode-linux-x64.tar.gz"))
       (sha256
        (base32 "0bpdag6zg529xlfkwzsz82lf7i2b6qlignz7x90gcwqsjp871a1q"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:patchelf-plan #~'()
      #:strip-binaries? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-and-wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (orig (string-append out "/opencode"))
                     (bash (search-input-file inputs "bin/bash"))
                     (patchelf (search-input-file inputs "bin/patchelf"))
                     (ld.so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                     (libpath (string-join
                               (list (string-append (assoc-ref inputs "gcc") "/lib")
                                     (string-append (assoc-ref inputs "glibc") "/lib")
                                     (string-append (assoc-ref inputs "libx11") "/lib")
                                     (string-append (assoc-ref inputs "mesa") "/lib"))
                               ":")))
                ;; Only patch interpreter; full patchelf corrupts this binary.
                (invoke patchelf "--set-interpreter" ld.so orig)
                (rename-file orig (string-append orig ".real"))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/opencode")
                  (lambda (port)
                    (format port "#!~a
export LD_LIBRARY_PATH=~a${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
exec ~a.real \"$@\"~%"
                            bash libpath orig)))
                (chmod (string-append bin "/opencode") #o755)))))))
    (native-inputs (list patchelf))
    (inputs (list bash-minimal
                  `(,gcc "lib")
                  libx11
                  glibc
                  mesa))
    (home-page "https://opencode.ai")
    (synopsis "the open source AI coding agent.")
    (description "OpenCode is an open source agent that helps you write code in your terminal.")
    (license license:expat)))

(define-public claude-code-bin
  (package
    (name "claude-code-bin")
    (version "2.1.224")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.claude.ai/claude-code-releases/"
             version "/linux-x64/claude"))
       (sha256
        (base32 "0bcw87wvl1nji5wxp61n0ys6jxyzqkd8nklz0am8xkabvkbsvdd2"))))
    (build-system binary-build-system)
    (supported-systems '("x86_64-linux"))
    (properties '((substitutable? . #f)))
    (arguments
     (list
      #:patchelf-plan #~'()
      #:strip-binaries? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "claude")
              (chmod "claude" #o755)))
          (add-after 'install 'patch-and-wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (orig (string-append out "/claude"))
                     (patchelf (search-input-file inputs "bin/patchelf"))
                     (sed (search-input-file inputs "bin/sed"))
                     (ld.so (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                     (libpath (string-join
                               (list (string-append (assoc-ref inputs "gcc") "/lib")
                                     (string-append (assoc-ref inputs "glibc") "/lib"))
                               ":")))
                ;; Patch /proc/self/exe for Bun module resolution
                (invoke sed "-i" "s|/proc/self/exe|/proc/self/ex_|g" orig)
                ;; Only patch interpreter; full patchelf corrupts this binary.
                (invoke patchelf "--set-interpreter" ld.so orig)
                (rename-file orig (string-append orig ".real"))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/claude")
                  (lambda (port)
                    (format port "#!~a
export DISABLE_AUTOUPDATER=1
export DISABLE_INSTALLATION_CHECKS=1
export LD_LIBRARY_PATH=~a${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
exec ~a.real \"$@\"~%"
                            #$(file-append bash-minimal "/bin/sh")
                            libpath
                            orig)))
                (chmod (string-append bin "/claude") #o755)))))))
    (native-inputs (list patchelf sed))
    (inputs (list bash-minimal
                  `(,gcc "lib")
                  glibc))
    (home-page "https://claude.ai/code")
    (synopsis "AI coding agent for the terminal")
    (description
     "Claude Code is an agentic coding tool that lives in your terminal.
It can understand your codebase, edit files, run terminal commands, and
handle entire workflows.  This package disables auto-updates.")
    (license
     (nonlicense:nonfree
      "https://code.claude.com/docs/en/legal-and-compliance"))))

(define-public cli-proxy-api
  (package
    (name "cli-proxy-api")
    (version "7.2.112")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/router-for-me/CLIProxyAPI")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qqzh7vx775jlz5xbxwyskmnmia221qa8nn9igkrpjaj1vkm4ymy"))))
    (build-system nix-go-build-system)
    (arguments
     `(#:vendor-hash "1iv4hsny5bxgsjx4gylg2p3w2cqlq73v839n3jd2vybw0nf70g8y"
       #:tidy? #f
       #:go ,go-1.26
       #:sub-packages ,(list "./cmd/server")
       #:ldflags `("-X" ,(string-append "main.Version=" ,version))
       #:install-source? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'rename-binary
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (old (string-append out "/bin/server"))
                    (new (string-append out "/bin/cli-proxy-api")))
               (when (file-exists? old)
                 (rename-file old new))
               #t))))))
    (home-page "https://github.com/router-for-me/CLIProxyAPI")
    (synopsis "Unified proxy for OpenAI, Anthropic, Gemini and OpenRouter APIs")
    (description
     "CLIProxyAPI is a lightweight, blazing-fast proxy server that provides
a unified OpenAI-compatible interface to seamlessly route requests across
multiple AI providers including OpenAI, Anthropic Claude, Google Gemini,
and OpenRouter.")
    (license license:expat)))
