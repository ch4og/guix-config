;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages waybar)
  #:use-module (guix base32)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages window-management))

(define-public waybar-experimental-git
  (let* ((commit "7f732f055316d3b0ab89f57e4347d24c1cc96167")
         (version (git-version (package-version waybar) "0" commit)))
    (package/inherit waybar
      (name "waybar-experimental-git")
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/Alexays/Waybar")
                (commit commit)))
         (file-name (git-file-name "waybar-experimental-git" version))
         (sha256
          (base32
           "06ry0n118a41dy1lbb2y558nc2ahrsz4s9mwhz0f6b9fcd4mwanh")))))))

waybar-experimental-git
