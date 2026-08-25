;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages steam)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages python)
  #:use-module ((guix licenses) #:prefix license:))

(define-public adwaita-for-steam
  (package
    (name "adwaita-for-steam")
    (version "4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tkashkin/Adwaita-for-Steam")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "05bp51pz98rrh95y6bxfmhkmf4j493zx2f0jmm23xqkxnvc36zf0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'make-skin-writable
            (lambda _
              (substitute* "scripts/installer/utils/fs.py"
                (("def copy_dir\\(source: Path, target: Path\\):\n")
                 "def make_writable(path: Path):
  for file in path.rglob(\"*\"):
    if not file.is_symlink():
      file.chmod(file.stat().st_mode | 0o200)
      path.chmod(path.stat().st_mode | 0o200)
def copy_dir(source: Path, target: Path):\n")
                (("    if target\\.is_dir\\(\\):")
                 "    if target.is_dir():
        make_writable(target)")
                (("    shutil\\.copytree\\(source, target\\)")
                 "    shutil.copytree(source, target)
    make_writable(target)"))))
          (replace 'install
            (lambda _
              (let ((data-dir (string-append #$output "/share/adwaita-for-steam"))
                    (bin (string-append #$output "/bin")))
                (copy-recursively "." data-dir)
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/adwaita-for-steam")
                  (lambda (port)
                    (format port "#!~a/bin/bash~%cd ~s~%exec ~a/bin/python3 ~s \"$@\"~%"
                            #$bash-minimal
                            data-dir
                            #$python
                            (string-append data-dir "/install.py"))))
                (chmod (string-append bin "/adwaita-for-steam") #o555)))))))
    (inputs (list bash-minimal python))
    (home-page "https://github.com/tkashkin/Adwaita-for-Steam")
    (synopsis "Adwaita skin for Steam")
    (description
     "Adwaita for Steam is a skin that makes the Steam client look more like a
native GNOME application.  The @command{adwaita-for-steam} command installs the
skin into a selected Steam installation.")
    (license (list license:expat license:silofl1.1))))
