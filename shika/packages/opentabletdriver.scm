;;; SPDX-FileCopyrightText: 2024-2026 Murilo <murilo@disroot.org>
;;; SPDX-FileCopyrightText: 2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages opentabletdriver)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xorg)
  #:use-module (nongnu packages dotnet)
  #:use-module (nonguix download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public opentabletdriver
  (package
    (name "opentabletdriver")
    (version "0.6.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenTabletDriver/OpenTabletDriver")
             (commit (string-append "v" version))))
       (sha256
        (base32 "0q3wc7zv7fadc0w7iihzysc0g4xwalv6mfmk0qwpzxnq73advgcc"))))
    (build-system gnu-build-system)
     (arguments
      (list
        #:phases
        #~(modify-phases %standard-phases
            (delete 'configure)
            (replace 'check
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((dotnet-bin (string-append (assoc-ref inputs "dotnet") "/bin/dotnet"))
                      (nuget-pkgs (string-append
                                   (assoc-ref inputs "restored-nuget-dependencies")
                                   "/nuget-packages")))
                  (setenv "DOTNET_CLI_TELEMETRY_OPTOUT" "1")
                  (setenv "DOTNET_NOLOGO" "1")
                  (setenv "DOTNET_SKIP_FIRST_TIME_EXPERIENCE" "1")
                  (setenv "NUGET_PACKAGES" nuget-pkgs)
                  (let ((home (getenv "TMPDIR")))
                    (setenv "HOME" home)
                    (mkdir-p (string-append home "/.dotnet")))
                  (invoke dotnet-bin "test"
                          "OpenTabletDriver.Tests/OpenTabletDriver.Tests.csproj"
                          "--framework" "net8.0"
                          "--configuration" "Release"
                          "--no-restore"
                          "--filter" (string-append
                                     "FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.CheckForUpdates_Returns_Update_When_Available"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.Install_Throws_UpdateAlreadyInstalledException_When_AlreadyInstalled"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.Install_DoesNotThrow_UpdateAlreadyInstalledException_When_PreviousInstallFailed"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.Install_Throws_UpdateInProgressException_When_AnotherUpdate_Is_InProgress"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.Install_Moves_UpdatedBinaries_To_BinDirectory"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.Install_Moves_Only_ToBeUpdated_Binaries"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.UpdaterTests.Install_Copies_AppDataFiles"
                                     "&FullyQualifiedName!=OpenTabletDriver.Tests.TimerTests.TimerAccuracy")))))
            (replace 'build
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((dotnet-bin (string-append (assoc-ref inputs "dotnet") "/bin/dotnet"))
                      (nuget-pkgs (string-append
                                   (assoc-ref inputs "restored-nuget-dependencies")
                                   "/nuget-packages")))
                  (setenv "DOTNET_CLI_TELEMETRY_OPTOUT" "1")
                  (setenv "DOTNET_NOLOGO" "1")
                  (setenv "DOTNET_SKIP_FIRST_TIME_EXPERIENCE" "1")
                  (setenv "NUGET_PACKAGES" nuget-pkgs)
                  (let ((home (getenv "TMPDIR")))
                    (setenv "HOME" home)
                    (mkdir-p (string-append home "/.dotnet")))
                  (when (file-exists? "NuGet.Config")
                    (delete-file "NuGet.Config"))
                  (call-with-output-file "NuGet.Config"
                    (lambda (port)
                      (display
                       (string-append
                        "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                        "<configuration>\n"
                        "  <packageSources>\n"
                        "    <clear />\n"
                        "  </packageSources>\n"
                        "</configuration>\n")
                       port)))
                  (invoke dotnet-bin "restore"
                          "--configfile" "NuGet.Config")
                  (for-each
                   (lambda (project)
                     (invoke dotnet-bin "publish" project
                           "--framework" "net8.0"
                           "--configuration" "Release"
                           "--no-restore"
                           "--output" "dist"
                           "-p:PublishTrimmed=false"
                           "-p:DebugType=None"
                           "-p:DebugSymbols=false"))
                   '("OpenTabletDriver.Daemon"
                     "OpenTabletDriver.Console"
                     "OpenTabletDriver.UX.Gtk")))))
            (replace 'install
              (lambda* (#:key inputs outputs #:allow-other-keys)
                (let ((out (assoc-ref outputs "out")))
                  (mkdir-p (string-append out "/bin"))
                  (copy-recursively "dist" (string-append out "/lib/opentabletdriver"))
                  (when (file-exists? "OpenTabletDriver.Configurations/Configurations")
                    (copy-recursively "OpenTabletDriver.Configurations/Configurations"
                                      (string-append out "/lib/opentabletdriver/Configurations")))
                  (let ((lib-paths
                         (string-join
                          (let loop ((rest inputs) (result '()))
                            (if (null? rest)
                                (reverse result)
                                (let* ((input (cdr (car rest)))
                                       (lib-dir (string-append input "/lib")))
                                  (loop (cdr rest)
                                        (if (file-exists? lib-dir)
                                            (cons lib-dir result)
                                            result)))))
                          ":")))
                    (for-each
                     (lambda (pair)
                       (let ((name (car pair))
                             (dll (cdr pair)))
                          (call-with-output-file (string-append out "/bin/" name)
                            (lambda (port)
                              (format port
                                      "#!~a~%\
export DOTNET_ROOT=~a~%\
export LD_LIBRARY_PATH=\"~a:${LD_LIBRARY_PATH:-}\"~%\
export OTD_CONFIGURATIONS=\"~a/lib/opentabletdriver/Configurations\"~%\
exec ~a/bin/dotnet ~a/lib/opentabletdriver/~a \"$@\"~%"
                                      #$(file-append bash-minimal "/bin/bash")
                                      (assoc-ref inputs "dotnet")
                                      lib-paths
                                      out
                                      (assoc-ref inputs "dotnet")
                                      out dll)))
                         (chmod (string-append out "/bin/" name) #o755)))
                     '(("otd-daemon" . "OpenTabletDriver.Daemon.dll")
                       ("otd" . "OpenTabletDriver.Console.dll")
                       ("otd-gui" . "OpenTabletDriver.UX.Gtk.dll")))
                    (mkdir-p (string-append out "/share/applications"))
                    (call-with-output-file
                        (string-append out "/share/applications/opentabletdriver.desktop")
                      (lambda (port)
                        (display "[Desktop Entry]
Version=1.5
Name=OpenTabletDriver
Comment=A cross-platform open-source tablet driver
Exec=otd-gui
Icon=otd
Terminal=false
Type=Application
Categories=Settings;
StartupNotify=true
StartupWMClass=OpenTabletDriver.UX
" port)))
                    (let ((assets "OpenTabletDriver.UX/Assets"))
                      (when (file-exists? assets)
                        (mkdir-p (string-append out "/share/icons/hicolor/256x256/apps"))
                        (copy-file (string-append assets "/otd.png")
                                   (string-append out "/share/icons/hicolor/256x256/apps/otd.png"))))
                    (mkdir-p (string-append out "/share/libinput"))
                    (call-with-output-file
                        (string-append out "/share/libinput/30-vendor-opentabletdriver.quirks")
                      (lambda (port)
                        (display "[OpenTabletDriver Virtual Tablets]
MatchName=OpenTabletDriver*
AttrTabletSmoothing=0
AttrPressureRange=2:1
" port)))
                    #t)))))))
     (native-inputs
      (list (origin
              (method (nuget-restore #:dotnet dotnet
                                     #:solutions '("OpenTabletDriver.sln")))
              (uri (package-source opentabletdriver))
              (file-name "restored-nuget-dependencies")
              (sha256
               (base32 "0g8ia1jl8d8ywkygg016704pshl4fwdgvgaqpfbgg07m1ynjqywc")))))
    (inputs (list bash-minimal
                   dotnet
                   eudev
                   gtk+
                   libevdev
                   libx11
                   libxrandr))
    (home-page "https://opentabletdriver.net")
    (synopsis "Open source, cross-platform, low latency, user-mode tablet driver")
    (description
     "OpenTabletDriver is an open source, cross platform, user mode tablet driver.
The goal of OpenTabletDriver is to be as cross platform as possible with the highest
compatibility in an easily configurable graphical user interface.")
    (license license:lgpl3+)))


(define-public opentabletdriver-udev-rules
  (package
    (name "opentabletdriver-udev-rules")
    (version (package-version opentabletdriver))
    (source (package-source opentabletdriver))
    (build-system gnu-build-system)
    (arguments
      (list #:modules '((guix build utils)
                        (guix build gnu-build-system)
                        (ice-9 popen)
                        (ice-9 textual-ports))
            #:phases
            #~(modify-phases %standard-phases
                (delete 'configure)
                (delete 'check)
                (replace 'build
                  (lambda _
                    (let* ((pipe (open-input-pipe "bash generate-rules.sh"))
                           (output (get-string-all pipe)))
                      (close-pipe pipe)
                      (call-with-output-file "70-opentabletdriver.rules"
                        (lambda (port)
                          (put-string port output))))))
                (replace 'install
                  (lambda _
                    (install-file "70-opentabletdriver.rules"
                                  (string-append #$output "/lib/udev/rules.d")))))))
    (native-inputs (list bash-minimal jq))
    (home-page "https://opentabletdriver.net")
    (synopsis "UDev rules for OpenTabletDriver")
    (description "Open source, cross-platform, user-mode tablet driver")
    (license license:lgpl3+)))
