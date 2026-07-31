;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages realm-core)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages tls)
  #:use-module ((guix licenses) #:prefix license:))

(define-public realm-core
  (let ((commit "10b706633bc94fce130ebe72707c6deb7a7ba041")
        (revision "0"))
    (package
      (name "realm-core")
      (version (git-version "14.12.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/realm/realm-core.git")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0rb5xi0akam6yr70y76vhx54nbmxn82rmdik6xd98zbvr5hipknx"))))
      (build-system cmake-build-system)
      (arguments
       (list
         #:tests? #t
         #:configure-flags
         #~(list "-DREALM_ENABLE_SYNC=OFF"
                "-DCMAKE_BUILD_TYPE=Release"
                "-DCMAKE_CXX_STANDARD=17"
                "-DREALM_USE_SYSTEM_OPENSSL=ON"
                "-DREALM_ENABLE_GEOSPATIAL=OFF"
                "-DREALM_FETCH_MISSING_DEPENDENCIES=OFF")
        #:phases
          #~(modify-phases %standard-phases
              (add-before 'configure 'patch-for-system-catch2
                (lambda _
                  (mkdir-p "test/external/catch")
                  (substitute* "test/CMakeLists.txt"
                    (("add_subdirectory\\(external/catch\\)")
                     "find_package(Catch2 CONFIG REQUIRED)")
                    (("target_compile_definitions\\(Catch2 PRIVATE _LIBCPP_DISABLE_AVAILABILITY\\)")
                     "# disabled for system Catch2")
                    (("target_link_libraries\\(CoreTests CoreTestLib TestUtil\\)")
                     "target_link_libraries(CoreTests CoreTestLib TestUtil Catch2::Catch2)")
                    (("target_link_libraries\\(CombinedTests ObjectStoreTestLib CoreTestLib TestUtil\\)")
                     "target_link_libraries(CombinedTests ObjectStoreTestLib CoreTestLib TestUtil Catch2::Catch2)"))
                  (with-atomic-file-replacement "test/object-store/CMakeLists.txt"
                    (lambda (in out)
                      (display "find_package(Catch2 CONFIG REQUIRED)\n" out)
                      (dump-port in out)))))
               (replace 'check
                 (lambda* (#:key tests? #:allow-other-keys)
                   (when tests?
                     (invoke "ctest" "--output-on-failure"
                             "-E" "CoreTests"
                             "-j" (number->string (parallel-job-count))
                             "--repeat" "until-pass:5"))))
               (add-after 'install 'install-external-headers
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((out (assoc-ref outputs "out")))
                  (copy-recursively "../source/src/external"
                                     (string-append out "/include/external"))))))))
      (inputs (list openssl zlib libuv catch2))
      (native-inputs (list cmake))
      (home-page "https://github.com/realm/realm-core")
      (synopsis "Core storage engine for Realm")
      (description
       "Realm Core is the cross-platform storage engine used by the Realm
database.  It provides an object-oriented data model with zero-copy
access, ACID transactions, and a query engine.")
      (license license:asl2.0))))

realm-core
