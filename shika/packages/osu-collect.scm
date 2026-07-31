;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages osu-collect)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix utils)
  #:use-module (shika utils cargo)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages tls)
  #:use-module (shika packages realm-core)
  #:use-module ((guix licenses) #:prefix license:))

(define-public osu-collect
  (package
    (name "osu-collect")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/uwuclxdy/osu-collect")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04w124mi8fx5in10d7mzaq8m59w4vlp72k67dwx5wv5pmx3d6pfv"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'patch-realm-core
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "REALM_CORE_PREFIX" (assoc-ref inputs "realm-core"))
              (substitute* "build.rs"
                (("let realm_build = cmake_config\\.build\\(\\);")
                 "let realm_build = std::path::PathBuf::from(env::var(\"REALM_CORE_PREFIX\").unwrap());"))))
          (replace 'check
            (lambda* (#:key tests? (cargo-test-flags '()) #:allow-other-keys)
               (when tests?
                 (apply invoke "cargo" "test" "--offline"
                        (append cargo-test-flags
                                (list "--" "--skip" "auto_update"
                                      "--skip" "theme_field_roundtrips"
                                      "--test-threads"
                                      (number->string (parallel-job-count)))))))))))
    (inputs
     (cons* openssl
            zlib
            realm-core
            (shika-cargo-inputs 'osu-collect)))
    (home-page "https://github.com/uwuclxdy/osu-collect")
    (synopsis "Download osu! beatmap collections from osu!collector website")
    (description
     "osu!collector downloader & updater; multiple mirrors, collection.db generation,
BBD-like beatmap search and more")
    (license license:expat)))

osu-collect
