;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages gamescope)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages stb)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (shika packages reshade)
  #:use-module (shika utils override)
  #:use-module ((guix licenses) #:prefix license:))

(define vkroots-valve
  (let ((commit "5106d8a0df95de66cc58dc1ea37e69c99afc9540"))
    (package
      (name "vkroots")
      (version (git-version "0.0.0" "0" commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/misyltoad/vkroots")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0hrp0xqq93552ipw2bmryixgm1aywnz49xagsx5rwzg2d0hwa0aa"))))
      (build-system meson-build-system)
      (home-page "https://github.com/misyltoad/vkroots")
      (synopsis "A stupid simple method of making Vulkan layers, at home!")
      (description
       "Framework for writing Vulkan layers that takes all the
complexity/hastle away from you! It's so simple!")
      (license (list license:asl2.0 license:expat)))))

(define wlroots-for-gamescope
  (shika-override wlroots
                      #:version "0.18.0"
                      #:commit "54e844748029d4874e14d0c086d50092c04c8899"
                      #:url "https://github.com/misyltoad/wlroots"
                      #:hash
                      "0sxgs157nzm6bkfyzh4dnl9zajg2bq1m1kq09xpxi2lm8ran3g05"
                      #:home-page "https://github.com/misyltoad/wlroots"))

(define reshade-for-gamescope
  (shika-override reshade
                      #:version "6.1.1"
                      #:commit "696b14cd6006ae9ca174e6164450619ace043283"
                      #:url "https://github.com/misyltoad/reshade"
                      #:hash
                      "1zvhf3pgd8bhn8bynrsh725xn1dszsf05j8c9g6zabgv7vnz04a5"
                      #:home-page "https://github.com/misyltoad/reshade"))

(define libliftoff-for-gamescope
  (shika-override libliftoff
                      #:version "0.5.0"
                      #:commit "8b08dc1c14fd019cc90ddabe34ad16596b0691f4"
                      #:hash
                      "163g8ndsbma7acy2k9mrnvlpb7yi4431hgkx1gygkafgwpq1ii1x"))

(define-public gamescope
  (package
    (name "gamescope")
    (version "3.16.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/ValveSoftware/gamescope")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "008yydjn6hqysfxm6s16hrz0xkh2zw2y8frrnd5ki7mag5xrm4bf"))))
    (build-system meson-build-system)
    (native-inputs (list bash-minimal pkg-config))
    (inputs (list catch2
                  eudev
                  glm
                  glslang
                  hwdata
                  libdecor
                  libdisplay-info
                  libx11
                  libxcomposite
                  libxcursor
                  libxdamage
                  libxext
                  libxkbcommon
                  libxmu
                  libxres
                  libxtst
                  libxxf86vm
                  luajit
                  openvr
                  pixman
                  python-gcovr
                  sdl2
                  spirv-headers
                  stb-image
                  stb-image-resize
                  stb-image-write
                  vulkan-loader
                  wayland
                  wayland-protocols

                  reshade-for-gamescope
                  libliftoff-for-gamescope
                  wlroots-for-gamescope
                  vkroots-valve))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'guix-fake-git
            (lambda _
              (let ((bin (string-append (getcwd) "/.fake-bin"))
                    (sh (string-append #$bash-minimal "/bin/sh")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/git")
                  (lambda (p)
                    (format p "#!~a\nexec echo ~a\n" sh #$version)))
                (chmod (string-append bin "/git") #o755)
                (setenv "PATH"
                        (string-append bin ":" (getenv "PATH"))))))

          (add-after 'unpack 'inject-reshade
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((reshade (assoc-ref inputs "reshade"))
                    (spirv-headers (assoc-ref inputs "spirv-headers")))
                (copy-recursively reshade "src/reshade")
                (copy-recursively spirv-headers "thirdparty/SPIRV-Headers"))))

          (add-after 'inject-reshade 'use-guix-not-fallback
            (lambda* _
              (substitute* "meson.build"
                ;; we are pinning deps to same commits as upstream
                ;; so we don't have problem removing this note made for packagers
                (("'force_fallback_for=wlroots,libliftoff,vkroots',\n")
                 "")
                (("error\\('!!!\"force_fallback_for\".*\n")
                 ""))))

          (add-after 'use-guix-not-fallback 'use-guix-glm
            (lambda* _
              (substitute* "meson.build"
                (("glm_proj = subproject\\('glm'\\)\n")
                 "")

                (("glm_dep = glm_proj.get_variable\\('glm_dep'\\)\n")
                 "glm_dep = dependency('glm', required: true)\n"))))

          (add-after 'use-guix-glm 'use-guix-openvr
            (lambda* _
              (substitute* "meson.build"
                (("openvr_proj = cmake.subproject\\('openvr', options : openvr_var\\)\n")
                 "")

                (("openvr_dep = openvr_proj.dependency\\('openvr_api'\\)")
                 "openvr_dep = dependency('openvr', required:true)"))))

          (add-after 'use-guix-openvr 'use-guix-stb
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((stb-image (assoc-ref inputs "stb-image"))
                    (stb-image-resize (assoc-ref inputs "stb-image-resize"))
                    (stb-image-write (assoc-ref inputs "stb-image-write")))
                (substitute* "meson.build"
                  (("stb_proj = subproject\\('stb'\\)\n")
                   "")

                  (("stb_dep = stb_proj.get_variable\\('stb_dep'\\)\n")
                   (string-append
                    "stb_dep = declare_dependency(\n"
                    "  include_directories: [\n"
                    "    include_directories('" stb-image "/include'),\n"
                    "    include_directories('" stb-image-resize "/include'),\n"
                    "    include_directories('" stb-image-write "/include')\n"
                    "  ]\n"
                    ")\n")))))))))

    (home-page "https://github.com/ValveSoftware/gamescope")
    (synopsis "SteamOS session compositing window manager")
    (description
     "The micro-compositor formerly known as steamcompmgr")
    (license license:bsd-2)))

gamescope
