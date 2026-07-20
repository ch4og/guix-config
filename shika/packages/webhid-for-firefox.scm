;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later
(define-module (shika packages webhid-for-firefox)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (gnu build icecat-extension)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages linux)
  #:use-module ((guix licenses) #:prefix license:))

(define-public soup
  (let ((commit "b02796b0b20276277c8a4b4d3759643eeab43ff7"))
  (package
    (name "soup")
    (version (git-version "0.0.0" "0" commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/calamity-inc/Soup")
             (commit commit)))
       (sha256
        (base32 "1b7n2hhxnsd7gkl8k4mn5dz9qfyaxa9pqa8ri59xxbm30v0cfzvh"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (let ((cpp-files (find-files "soup" "\\.cpp$")))
                (apply invoke "g++" "-std=c++17" "-O3" "-fPIC"
                       "-c" cpp-files))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (obj-files (find-files "." "\\.o$")))
                (mkdir-p (string-append out "/lib"))
                (apply invoke "ar" "rcs"
                       (string-append out "/lib/libsoup.a")
                       obj-files)
                (mkdir-p (string-append out "/include/soup"))
                (for-each
                 (lambda (f)
                   (install-file f (string-append out "/include/soup")))
                 (find-files "soup" "\\.hpp$"))))))))
    (native-inputs
     (list gcc-toolchain))
    (home-page "https://github.com/calamity-inc/Soup")
    (synopsis "The everything library for C++ 17")
    (description
     "Soup is a general-purpose C++ 17 library providing networking, cryptography,
HID access, concurrency primitives, and various utilities.")
    (license license:unlicense))))

(define-public webhid-for-firefox
  (package
    (name "webhid-for-firefox")
    (version "0.2.101")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url (string-append "https://github.com/ch4og/WebHID-for-Firefox"))
             (commit version)))
       (sha256
        (base32 "1rlyddh6qn5s78f3slmrbf1xnnma65mrsj676zrw4zv0lsy0y4q4"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((soup (assoc-ref inputs "soup")))
                (invoke "g++" "-std=c++17" "-O3"
                        (string-append "-I" soup "/include/soup")
                        "-o" "WebHID-for-Firefox-Server"
                        "server/main.cpp"
                        (string-append soup "/lib/libsoup.a")
                        "-lpthread" "-lm" "-ldl" "-lresolv"
                        "-lstdc++fs"))))
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (udev (assoc-ref inputs "eudev")))
                (install-file "WebHID-for-Firefox-Server"
                              (string-append out "/bin"))
                (wrap-program (string-append out "/bin/WebHID-for-Firefox-Server")
                  `("LD_LIBRARY_PATH" = (,(string-append udev "/lib"))))))))))
    (native-inputs
     (list gcc-toolchain))
    (inputs
     (list soup eudev))
    (home-page "https://github.com/ch4og/WebHID-for-Firefox")
    (synopsis "WebHID API polyfill for Firefox via a local WebSocket server")
    (description
     "WebHID for Firefox provides a local WebSocket server that bridges
HID device access to a Firefox WebExtension, enabling the WebHID API
for devices that don't natively support it.  This is the server
component; the companion Firefox extension is available as a separate
package.  The original version of extension from Firefox Add-ons will
not work with this forked server.")
    (license license:unlicense)))


(define-public webhid-for-firefox/icecat
  (make-icecat-extension
   (package
     (name "webhid-for-firefox")
     (version "0.2.101")
     (source (origin
               (method url-fetch/zipbomb)
               (uri (string-append "https://github.com/ch4og/WebHID-for-Firefox"
                                   "/releases/download/" version
                                   "/WebHID-for-Firefox.xpi"))
               (sha256
                (base32 "0zc1p5w1dddcmnrx6mdrw4av71y49wgsv04mzql3y12wlx6vjizs"))))
     (build-system copy-build-system)
     (arguments
      (list #:install-plan
            #~'(("." #$(assq-ref (package-properties this-package) 'addon-id)))))
     (home-page "https://github.com/ch4og/WebHID-for-Firefox")
     (synopsis "Firefox extension for WebHID API access via local WebSocket server")
     (description
      "WebHID for Firefox extension provides the client side of the WebHID
API polyfill, communicating with the local WebSocket server component
to enable HID device access in Firefox.  Requires the companion server
package to function.")
     (license license:unlicense)
     (properties
      '((addon-id . "webhid@for-firefox"))))))
