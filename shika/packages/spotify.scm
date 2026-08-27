;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages spotify)
  #:use-module (guix packages)
  #:use-module (guix build-system go)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (shika build-system interpreter-binary)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonlicense:))

(define-public spotify-bin
  (let ((rev "99"))
    (package
    (name "spotify-bin")
    (version "1.2.95.453.g0eeebbed")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://api.snapcraft.io/api/v1/snaps/download/"
         "pOBIoZ2LrCB3rDohMxoYGnbN14EHOgD7_" rev ".snap"))
       (file-name (string-append name "-" version ".snap"))
       (sha256
        (base32
         "1081yrvpv9z24b84v2dhg9ssr83ppqqvy7xx3pka6zzsliqnwr29"))))
    (build-system interpreter-binary-build-system)
    (supported-systems '("x86_64-linux"))
    (properties '((substitutable? . #f)))
    (native-inputs (list squashfs-tools))
    (inputs
     (list alsa-lib
           at-spi2-core
           bash-minimal
           cairo
           cups
           dbus
           eudev
           expat
           ffmpeg-6
           gcc-toolchain
           gdk-pixbuf
           glib
           gtk+
           harfbuzz
           libappindicator
           libdbusmenu
           libdrm
           libx11
           libxcb
           libxcomposite
           libxdamage
           libxext
           libxfixes
           libxkbcommon
           libxrandr
           mesa
           nspr
           nss
           openssl
           pango
           pulseaudio
           vulkan-loader
           zlib))
    (arguments
     (list
      #:install-plan #~'(("usr/share/spotify/" "lib/spotify"))
      #:wrapper-plan #~'(("lib/spotify/spotify" ".spotify-real"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unsquashfs" "-d" "snap-root" source)
              (chdir "snap-root")))
          (add-after 'unpack 'remove-unneeded-files
            (lambda _
              (for-each
               (lambda (file)
                 (delete-file-recursively
                  (string-append "usr/share/spotify/" file)))
               '("apt-keys"
                 "spotify.desktop"
                 "icons/spotify_icon.ico"
                 "libEGL.so"
                 "libGLESv2.so"
                 "libvulkan.so.1"
                 "libvk_swiftshader.so"
                 "vk_swiftshader_icd.json"))))
          (add-after 'remove-unneeded-files 'patch-binary
            (lambda _
              (let ((binary "usr/share/spotify/spotify"))
                (chmod binary #o755)
                (invoke "patchelf" "--replace-needed"
                        "libayatana-appindicator3.so.1"
                        "libappindicator3.so.1"
                        binary)
                (invoke "patchelf" "--remove-needed"
                        "libayatana-indicator3.so.7" binary)
                (invoke "patchelf" "--remove-needed"
                        "libayatana-ido3-0.4.so.0" binary))))
          (add-after 'create-binary-wrapper 'install-desktop-files
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (desktop-directory
                      (string-append out "/share/applications"))
                     (desktop-file
                      (string-append desktop-directory "/spotify.desktop"))
                     (icon-directory
                      (string-append out "/share/icons/hicolor")))
                (mkdir-p (string-append out "/bin"))
                (symlink "../lib/spotify/spotify"
                         (string-append out "/bin/spotify"))
                (mkdir-p desktop-directory)
                (copy-file "meta/gui/spotify.desktop" desktop-file)
                (substitute* desktop-file
                  (("^Icon=.*$" _) "Icon=spotify"))
                (for-each
                 (lambda (icon)
                   (let* ((name (basename icon))
                          (prefix "spotify-linux-")
                          (suffix ".png")
                          (size (substring name
                                          (string-length prefix)
                                          (- (string-length name)
                                             (string-length suffix))))
                          (directory
                           (string-append icon-directory "/" size
                                          "x" size "/apps")))
                     (mkdir-p directory)
                     (symlink (string-append "../../../../../lib/spotify/icons/" name)
                              (string-append directory "/spotify.png"))))
                 (find-files "usr/share/spotify/icons"
                             "^spotify-linux-[0-9]+\\.png$"))))))))
    (home-page "https://www.spotify.com/")
    (synopsis "Music streaming client")
    (description
     "Spotify is the official proprietary desktop client for the Spotify music
streaming service.  This package extracts Spotify's official Snap package and
runs it directly with Guix's dynamic linker.")
    (license
     (nonlicense:nonfree
      "https://www.spotify.com/legal/end-user-agreement/")))))

(define-public spicetify-cli
  (package
    (name "spicetify-cli")
    (version "2.43.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/spicetify/cli")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "166zg65fk3wa7w11wn7w34ipxckhnsx6gv8xwl44cvkj7da9kczg"))))
    (build-system go-build-system)
    (inputs
     (list go-github-com-go-ini-ini
           go-github-com-mattn-go-colorable
           go-github-com-pterm-pterm
           go-golang-org-x-net
           go-golang-org-x-sys))
    (arguments
     `(#:import-path "github.com/spicetify/cli"
       #:unpack-path "github.com/spicetify/cli"
       #:go ,go-1.26
       #:tests? #f
       #:install-source? #f
       #:build-flags
       (list ,(string-append "-ldflags=-s -w -X main.version=" version))
       #:phases (modify-phases %standard-phases
                  ;; Treat the release build as a development build so the
                  ;; bundled CSS map is used instead of fetching one at runtime.
                  (add-after 'unpack 'patch-version
                    (lambda _
                      (let ((source-dir "src/github.com/spicetify/cli"))
                        (substitute* (string-append source-dir
                                                    "/src/preprocess/preprocess.go")
                          (("version != \\\"Dev\\\"")
                           ,(string-append "version != \"" version "\""))))))
                  (add-after 'install 'install-assets
                    (lambda* (#:key outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (old (string-append out "/bin/cli"))
                             (directory (string-append out "/share/spicetify"))
                             (binary (string-append directory "/spicetify"))
                             (source-dir "src/github.com/spicetify/cli"))
                        (mkdir-p directory)
                        (rename-file old binary)
                        (copy-recursively (string-append source-dir "/jsHelper")
                                          (string-append directory "/jsHelper"))
                        (install-file (string-append source-dir "/css-map.json")
                                      directory)
                        (symlink "../share/spicetify/spicetify"
                                 (string-append out "/bin/spicetify"))))))))
    (home-page "https://github.com/spicetify/cli")
    (synopsis "Command-line tool to customize Spotify client")
    (description
     "Spicetify is a command-line tool to customize the Spotify client.")
    (license license:lgpl2.1+)))
