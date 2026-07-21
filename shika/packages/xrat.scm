;;; Copyright © 2025 Zhu Zihao <all_but_last@163.com>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages xrat)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix base16)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages base)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sqlite)
  #:use-module (shika utils cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public xray
  (package
    (name "xray")
    (version "25.6.8")
    (source
     (origin
       (method url-fetch/zipbomb)
       (uri (string-append "https://github.com/XTLS/Xray-core/releases/download/v"
                           version "/Xray-linux-64.zip"))
       (file-name (string-append name "-" version ".zip"))
       (sha256
        (base16-string->bytevector
         "51bcd3304fdbd64b58048b056da005fbaa6c83577fc351cae34024760e111e4b"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("xray" "bin/")
          ("." "share/xray-geodata" #:include ("dat")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-geodata
            (lambda _
              (let* ((bin (string-append #$output "/bin"))
                     (assets-dir (string-append #$output
                                                "/share/xray-geodata")))
                (wrap-program (string-append bin "/xray")
                  `("XRAY_LOCATION_ASSET" = (,assets-dir)))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/XTLS/Xray-core")
    (synopsis "Binary version of Xray")
    (description
     "Xray-bin is platform for building proxies to bypass network restrictions.")
    (license license:mpl2.0)))

(define-public xrat
  (package
    (name "xrat")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/mhyrzt/xrat")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
         (base32 "0q1p2mv0ligkxlbgy9y5sj6wc1mwl9y52ivss6iqr91jsqa6l1nr"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'check
            (lambda* (#:key (tests? #t) (parallel-tests? #t) #:allow-other-keys)
              (if tests?
                  (invoke "cargo" "test" "--offline"
                          "-j" (number->string (parallel-job-count))
                          "--"
                          "--skip" "binary_cases"
                          "--skip" "builds_chain_lookup"
                          "--skip" "builds_ip_api_lookup_chain"
                          "--skip" "builds_ipwhois_lookup_chain"
                          "--skip" "connect_and_disconnect_persist"
                          "--skip" "connect_hy2_uses_managed"
                          "--skip" "database_cases"
                          "--skip" "disconnect_returns_daemon_unreachable_hint"
                          "--skip" "geoip::download"
                          "--skip" "health_tick_timer_due_success"
                          "--skip" "icmp"
                          "--skip" "manual_rotate_accepts_tcp_only"
                          "--skip" "manual_rotate_selects_tested"
                          "--skip" "manual_rotate_with_explicit_candidate"
                          "--skip" "remote_ip_api"
                          "--skip" "remote_ipwhois"
                          "--skip" "replace_starts_runtime_without"
                          "--skip" "replace_success_stages_new"
                          "--test-threads"
                          (number->string (parallel-job-count)))
                  #t))))))
    (native-inputs (list pkg-config))
    (inputs (cons* nss-certs
                   sqlite
                   xray
                   (shika-cargo-inputs 'xrat)))
    (home-page "https://github.com/mhyrzt/xrat")
    (synopsis "Xray-core and sing-box Proxy Manager")
    (description
     "Rust CLI/TUI proxy manager for Xray-core, V2Ray-core, and sing-box:
import subscriptions, test latency, rotate proxies, scan edge IPs, and run
managed local proxy sessions.")
    (license license:expat)))

xrat
