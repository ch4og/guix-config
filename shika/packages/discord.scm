;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages discord)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pulseaudio)
  #:use-module (guix build-system node)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (shika build-system ld-binary)
  #:use-module (shika packages development)
  #:use-module (shika packages discord)
  #:use-module (nongnu packages electron))

(define-public arrpc-bun-bin
  (package
    (name "arrpc-bun-bin")
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
    (build-system ld-binary-build-system)
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

(define equibop-version "3.2.2")

(define equibop-node-modules
  (let ((hash "14k4i18xwn3ahp2p40ahi2allbwj2a8ar6rml5h9a6i30m75r29s"))
    (origin
      (method url-fetch)
      (uri
       (string-append "https://github.com/Equicord/Equibop/"
                      "releases/download/v" equibop-version "/"
                      "node_modules-x64.tar.gz"))
      (sha256 (base32 hash)))))

(define-public equibop
  (package
    (name "equibop")
    (version equibop-version)
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Equicord/Equibop")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0fxs4x8y3imjyam58irdaqsxd35dawsis2bw7hzbx3km4fvs10ky"))))
    (build-system node-build-system)
    (inputs
     (list arrpc-bun-bin
           bash-minimal
           electron-41
           gcc
           pipewire
           pulseaudio))
    (native-inputs
     (list bun-bin))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'patch-dependencies)
          (delete 'delete-lockfiles)
          (delete 'check)
          (delete 'repack)
          (delete 'avoid-node-gyp-rebuild)
          (add-after 'unpack 'extract-node-modules
            (lambda _
              (invoke "tar" "-xzf" #$equibop-node-modules)))
          (add-after 'extract-node-modules 'patch-source
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute*
                  "src/main/updater.ts"
                (("const isOutdated = .*;")
                 "const isOutdated = false;"))
              (let* ((arrpc (assoc-ref inputs "arrpc-bun-bin"))
                     (arrpc-bin (string-append arrpc "/bin/arrpc")))
                (substitute* "src/main/arrpc/index.ts"
                  (("    if \\(platform === \\\"linux\\\"\\) \\{")
                   (string-append
                    "    if (platform === \"linux\") {\n"
                    "        searchPaths.push(\"" arrpc-bin "\");"))))
              (substitute* "scripts/build/afterPack.mjs"
                (("    await copyArRPCBinaries.*")
                 ""))))
          (add-after 'patch-source 'prepare-electron-dist
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((electron (assoc-ref inputs "electron"))
                     (electron-dist (string-append electron "/share/electron")))
                (copy-recursively electron-dist "electron-dist"))
              (invoke "chmod" "-R" "u+w" "electron-dist")))
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((bun (assoc-ref inputs "bun-bin"))
                     (bun-bin (string-append bun "/bin/bun"))
                     (electron (assoc-ref inputs "electron"))
                     (electron-version
                      (call-with-values
                          (lambda ()
                            (package-name->name+version
                             (strip-store-file-name electron)))
                        (lambda (_ version) version))))
                (invoke bun-bin "run" "build")
                (invoke bun-bin "run" "electron-builder"
                        "--dir"
                        "-c.electronDist=electron-dist"
                        (string-append "-c.electronVersion="
                                       electron-version)
                        "-c.npmRebuild=false"))))
          (replace 'install
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((app-asar "dist/linux-unpacked/resources/app.asar")
                     (app-dir (string-append #$output "/lib/equibop"))
                     (bin (string-append #$output "/bin"))
                     (wrapper (string-append bin "/equibop"))
                     (bash (assoc-ref inputs "bash-minimal"))
                     (bash-bin (string-append bash "/bin/bash"))
                     (electron (assoc-ref inputs "electron")))
                (mkdir-p app-dir)
                (copy-file app-asar (string-append app-dir "/app.asar"))
                (mkdir-p bin)
                (with-output-to-file wrapper
                  (lambda ()
                    (display
                     (string-join
                      `(,(string-append "#!" bash-bin)
                        "flags_file=\"${XDG_CONFIG_HOME:-$HOME/.config}/equibop-flags.conf\""
                        "[[ -f \"$flags_file\" ]] &&"
                        "mapfile -t flags < <(grep -vE '^[[:space:]]*(#|$)' \"$flags_file\")"
                        ,(string-append "exec \"" electron "/bin/electron\" \""
                                        app-dir "/app.asar\" \"${flags[@]}\" \"$@\""))
                      "\n"))))
                (chmod wrapper #o755)
                (let* ((share (string-append #$output "/share"))
                       (icon-dir (string-append share "/icons/hicolor/scalable/apps"))
                       (desktop-dir (string-append share "/applications"))
                       (icon (string-append icon-dir "/org.equicord.equibop.svg"))
                       (desktop (string-append desktop-dir "/equibop.desktop")))
                  (mkdir-p icon-dir)
                  (mkdir-p desktop-dir)
                  (copy-file "build/icon.svg" icon)
                  (copy-file "build/org.equicord.equibop.desktop" desktop)))))
          (add-after 'patch-shebangs 'wrap-venmic-libraries
            (lambda* (#:key inputs #:allow-other-keys)
              (apply wrap-program
                     (string-append #$output "/bin/equibop")
                     `(("LD_LIBRARY_PATH" ":" prefix
                        ,(map (lambda (name)
                                (string-append (assoc-ref inputs name) "/lib"))
                              '("pulseaudio" "pipewire" "gcc"))))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Custom Discord client optimized for Linux")
    (description
     "Equibop is a custom Discord client aiming to improve performance and
Linux support.  It is a fork of Vesktop.")
    (home-page "https://github.com/Equicord/Equibop")
    (license license:gpl3)))
