;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika utils override)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix deprecation)
  #:export (shika-override
            shika-git-override))

(define* (shika-override base
                             #:key
                             (name (package-name base))
                             (version (package-version base))
                             (commit (string-append "v" version))
                             (url (let ((uri (origin-uri (package-source base))))
                                    (if (git-reference? uri)
                                        (git-reference-url uri)
                                        uri)))
                             hash
                             (inputs (package-inputs base))
                             (native-inputs (package-native-inputs base))
                             (home-page (package-home-page base)))
  (package
    (inherit base)
    (name name)
    (version
     (if (string-prefix? "v" commit)
         version
         (git-version version "0" commit)))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (commit commit)
              (url url)))
       (file-name (git-file-name name version))
       (sha256
        (base32 hash))))
    (inputs inputs)
    (native-inputs native-inputs)
    (home-page home-page)))

(define-deprecated/alias shika-git-override shika-override)
