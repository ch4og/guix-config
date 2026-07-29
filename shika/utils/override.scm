;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika utils override)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (ice-9 regex)
  #:export (shika-override))

(define* (shika-override base
                             #:key
                             (name (package-name base))
                             (version (package-version base))
                             (commit (string-append "v" version))
                             (url (let ((uri (origin-uri (package-source base))))
                                    (if (git-reference? uri)
                                        (git-reference-url uri)
                                        uri)))
                             (hash (bytevector->nix-base32-string
                                    (content-hash-value
                                     (origin-hash (package-source base)))))
                             (patches '())
                             (inputs (package-inputs base))
                             (native-inputs (package-native-inputs base))
                             (home-page (package-home-page base)))
  (let* ((shika-inputs inputs)
         (shika-native-inputs native-inputs)
         (len (string-length commit))
         (is-hash? (and (or (= len 40) (= len 64))
                        (not (string-match "[^0-9a-f]" commit)))))
    (package
      (inherit base)
      (name name)
      (version
       (if is-hash?
           (git-version version "0" commit)
           (if (string-prefix? "v" commit)
               (substring commit 1)
               commit)))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (commit commit)
                (url url)))
         (file-name (git-file-name name version))
         (sha256
          (base32 hash))
         (patches patches)))
      (inputs shika-inputs)
      (native-inputs shika-native-inputs)
      (home-page home-page))))
