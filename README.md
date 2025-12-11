<h3 align="center">💎 Neved4's Homebrew Formulae!</h3>
<p align="center">
  <a href="#getting-started">Getting Started</a> &bull;
  <a href="#my-formulae--casks-">My Formulae & Casks</a> &bull;
  <a href="#third-party-">Third-party</a> &bull;
  <a href="#license">License</a>
</p>

---

[Homebrew] taps for [Neved4]'s patches & utilities. Updated _monthly_.

## Getting Started

To install any of the formulas below:

1. Tap the repository:

    ```sh
    brew tap Neved4/tap
    ```

2. Install a formula:

    ```sh
    brew install <name>
    ```

## My Formulae & Casks 🍺

<!-- START SYNC -->

[<kbd>ada</kbd>]: https://www.adacore.com/about-ada
[<kbd>awk</kbd>]: https://github.com/onetrueawk/awk
[<kbd>c++</kbd>]: https://isocpp.org
[<kbd>c</kbd>]: https://www.c-language.org/
[<kbd>c-sharp</kbd>]: https://learn.microsoft.com/dotnet/csharp/
[<kbd>fish-shell</kbd>]: https://fishshell.com/
[<kbd>go</kbd>]: https://go.dev/
[<kbd>iso-8601</kbd>]: https://www.iso.org/iso-8601-date-and-time-format.html
[<kbd>java</kbd>]: https://dev.java/
[<kbd>javascript</kbd>]:
  https://ecma-international.org/publications-and-standards/standards/ecma-262/
[<kbd>objective-c</kbd>]:
  https://developer.apple.com/documentation/objc
[<kbd>posix-shell</kbd>]:
  https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
[<kbd>php</kbd>]: https://www.php.net/
[<kbd>python</kbd>]: https://www.python.org
[<kbd>ruby</kbd>]: https://www.ruby-lang.org/en/
[<kbd>rust</kbd>]: https://www.rust-lang.org/
[<kbd>swift</kbd>]: https://www.swift.org/
[<kbd>typescript</kbd>]: https://www.typescriptlang.org/
[<kbd>font-family</kbd>]: https://en.wikipedia.org/wiki/Typeface
[<kbd>tz-database</kbd>]: https://www.iana.org/time-zones
[<kbd>txt</kbd>]: https://en.wikipedia.org/wiki/Plain_text
[<kbd>zig</kbd>]: https://ziglang.org/

[applist]: https://github.com/Neved4/applist
[apputils]: https://github.com/Neved4/apputils
[BSD 2-Clause License]: https://opensource.org/license/bsd-2-clause/
[dnspeek]: https://github.com/Neved4/dnspeek
[dnsrecce]: https://github.com/Neved4/dnsrecce
[gotwc]: https://github.com/Neved4/gotwc
[Homebrew]: https://brew.sh/
[Neved4]: https://github.com/Neved4
[sw_name]: https://github.com/Neved4/sw_name
[tmbackup]: https://github.com/Neved4/tmbackup
[tmexcludes]: https://github.com/Neved4/tmexcludes
[twc]: https://github.com/Neved4/twc

### macOS 

- [applist] [<kbd>objective-c</kbd>] [<kbd>swift</kbd>] [<kbd>posix-shell</kbd>]
  List the paths to all installed apps in macOS.
- [apputils] [<kbd>fish-shell</kbd>] [<kbd>posix-shell</kbd>]
  Find and list macOS app paths.
- [tmbackup] [<kbd>posix-shell</kbd>] [<kbd>awk</kbd>]
  Perform Time Machine backups on all connected drives.
- [tmexcludes] [<kbd>posix-shell</kbd>]
  Show, backup and restore Time Machine exclusions.
- [sw_name] [<kbd>posix-shell</kbd>]
  Drop-in replacement for `sw_vers` to retrieve macOS friendly names.

### Date and time ⌚️

- [twc] [<kbd>c</kbd>] [<kbd>iso-8601</kbd>] [<kbd>tz-database</kbd>]
  Displays time zones using the tz database.
- [gotwc] [<kbd>go</kbd>] [<kbd>iso-8601</kbd>] [<kbd>tz-database</kbd>]
  Go version, display different time zones from the tz database.

### Security 🔐

- [dnspeek] [<kbd>go</kbd>]
  DNS reconnaissance CLI written in Go.
- [dnsrecce] [<kbd>go</kbd>]
  DNS reconnaissance CLI with Google scraping and XML output.

<!-- END SYNC -->

## Third-party 🍻

### Formula

- [alire] [<kbd>ada</kbd>]
  Ada/SPARK package manager.
- [apfs-clone-checker] [<kbd>c</kbd>]
  Utility to check if two files are APFS clones.
- [apg-go] [<kbd>go</kbd>]
  A modern "Automated Password Generator"-clone written in Go.
- [astroguard] [<kbd>posix-shell</kbd>]
  Code auditing and profiling tool based on gcc for C programs.
- [autorecon] [<kbd>python</kbd>]
  Multi-threaded network reconnaissance tool.
- [center] [<kbd>c</kbd>]
  Centers text read from stdin.
- [codacy-analysis-cli] [<kbd>java</kbd>]
  CLI for running Codacy analysis engines.
- [cronie] [<kbd>c</kbd>]
  Cron daemon for Unix-like operating systems.
- [cut-cdn] [<kbd>go</kbd>]
  Remove CDN IPs from the list of IP addresses.
- [demagnetize] [<kbd>python</kbd>]
  Convert magnet links to .torrent files.
- [demagnetize-rs] [<kbd>rust</kbd>]
  Convert magnet links to .torrent files.
- [dgen] [<kbd>c</kbd>]
  Sega Genesis / Mega Drive emulator.
- [dnsrecon] [<kbd>python</kbd>]
  DNS enumeration and reconnaissance tool.
- [elegantbouncer] [<kbd>rust</kbd>]
  Detection tool for file-based exploits.
- [evry] [<kbd>rust</kbd>]
  Shell-script-centric task scheduler.
- [fcron] [<kbd>c</kbd>]
  Periodic command scheduler.
- [gochro] [<kbd>go</kbd>]
  Take screenshots of websites and create PDF from HTML pages using Chromium and Docker.
- [htrace-sh] [<kbd>posix-shell</kbd>]
  HTTP/HTTPS troubleshooting and profiling wrapper.
- [hyperspec]
  Common Lisp ANSI-standard Hyperspec.
- [inferno] [<kbd>rust</kbd>]
  High-performance flamegraph generator.
- [iozone] [<kbd>c</kbd>]
  Filesystem benchmark tool.
- [johnnybgoode] [<kbd>rust</kbd>]
  An assistant for users of the Johnny Decimal file organization system.
- [jsmin] [<kbd>c</kbd>]
  Minify JavaScript code.
- [kamal] [<kbd>ruby</kbd>]
  Deploy web apps anywhere.
- [keyscan] [<kbd>python</kbd>]
  GitHub Gists scanner with LLM-based classification.
- [koino] [<kbd>zig</kbd>]
  CommonMark + GFM compatible Markdown parser and renderer
- [mixed-content-scan] [<kbd>php</kbd>]
  Scan your HTTPS-enabled website for Mixed Content.
- [nbtscan] [<kbd>c</kbd>]
  Scan networks for NetBIOS name information.
- [observatory] [<kbd>javascript</kbd>]
  Mozilla HTTP Observatory CLI.
- [packer-tmp] [<kbd>go</kbd>]
  Tool for creating identical machine images for multiple platforms.
- [pd-urlfinder] [<kbd>go</kbd>]
  Tool for passively gathering URLs.
- [penelope] [<kbd>python</kbd>]
  Powerful shell handler built as a modern netcat replacement.
- [pprof] [<kbd>go</kbd>]
  Interactive visualizations and analysis of profiling data.
- [puncia] [<kbd>python</kbd>]
  Official CLI utility for Osprey Vision, Subdomain Center & Exploit Observer.
- [regular] [<kbd>typescript</kbd>]
  Job scheduler: an alternative to cron and anacron.
- [seclists] [<kbd>txt</kbd>]
  Collection of multiple security wordlists.
- [tidy] [<kbd>rust</kbd>]
  Word list cleaner and deduper.
- [tuckr] [<kbd>rust</kbd>]
  Dotfile manager for templated and synced configs.
- [typst-ansi-hl] [<kbd>go</kbd>]
  Highlight your Typst code using ANSI escape sequences.
- [unarj] [<kbd>c</kbd>]
  ARJ file archiver.
- [volatility] [<kbd>python</kbd>]
  Advanced memory forensics framework.
- [wafw00f] [<kbd>python</kbd>]
  Web Application Firewall (WAF) fingerprinting tool.
- [withjava] [<kbd>rust</kbd>]
  Wrap commands in specific Java versions.
- [wmiexec-pro] [<kbd>python</kbd>]
  New generation of wmiexec.py
- [wordlists] [<kbd>txt</kbd>]
  Collection of common wordlists.
- [wordtidy] [<kbd>rust</kbd>]
  Combine and clean word lists.

### Casks

- [boinc@7] [<kbd>c++</kbd>]
  Downloads scientific computing jobs and runs them invisibly in the background.
- [burp-browser] [<kbd>c++</kbd>]
  Chromium stable, from Burp Browser.
- [chromium@api] [<kbd>c++</kbd>]
  Chromium web browser, with API features enabled.
- [cinny] [<kbd>javascript</kbd>] [<kbd>rust</kbd>]
  Yet another matrix client for desktop.
- [cluely] [<kbd>javascript</kbd>]
  AI meeting assistant with live notes and real-time insights.
- [font-monego] [<kbd>font-family</kbd>]
  Monaco monospaced inspired font.
- [freewrite] [<kbd>swift</kbd>]
  Write continuously without distraction.
- [google-chrome-testing] [<kbd>c++</kbd>]
  Google Chrome for Testing override.
- [interviewcoder]
  Provides assistance during coding interviews.
- [lofloccus] [<kbd>c++</kbd>] [<kbd>go</kbd>]
  Sync Floccus bookmarks to a local folder or any cloud service.
- [nfov@tmp] [<kbd>typescript</kbd>]
  ASCII / ANSI art viewer.
- [pear] [<kbd>typescript</kbd>]
  YouTube Music desktop app.
- [runtimebrowser] [<kbd>objective-c</kbd>]
  Class browser for the Objective-C runtime.
- [spacestation14] [<kbd>c-sharp</kbd>]
  Launcher for Space Station 14 game.

[alire]: https://github.com/alire-project/alire
[apfs-clone-checker]: https://github.com/dyorgio/apfs-clone-checker
[apg-go]: https://github.com/wneessen/apg-go
[astroguard]: https://github.com/ANG13T/astroguard
[autorecon]: https://github.com/Tib3rius/AutoRecon
[boinc@7]: https://boinc.berkeley.edu/
[burp-browser]: https://www.chromium.org/Home/
[center]: https://github.com/LizzyFleckenstein03/center
[chromium@api]: https://www.chromium.org/Home/
[cinny]: https://github.com/cinnyapp/cinny-desktop
[cluely]: https://cluely.com/
[codacy-analysis-cli]: https://github.com/codacy/codacy-analysis-cli
[cronie]: https://github.com/cronie-crond/cronie
[cut-cdn]: https://github.com/ImAyrix/cut-cdn
[demagnetize-rs]: https://github.com/jwodder/demagnetize-rs
[demagnetize]: https://github.com/jwodder/demagnetize
[dgen]: https://dgen.sourceforge.net/
[dnsrecon]: https://github.com/darkoperator/dnsrecon
[elegantbouncer]: https://github.com/msuiche/elegant-bouncer
[evry]: https://github.com/purarue/evry
[fcron]: https://github.com/yo8192/fcron
[font-monego]: https://github.com/cseelus/monego
[freewrite]: https://freewrite.io/
[gochro]: https://github.com/firefart/gochro
[google-chrome-testing]: https://developer.chrome.com/blog/chrome-for-testing
[htrace-sh]: https://github.com/trimstray/htrace.sh/
[hyperspec]: https://www.lispworks.com/documentation/common-lisp.html
[inferno]: https://github.com/jonhoo/inferno
[interviewcoder]: https://www.interviewcoder.co/
[iozone]: https://www.iozone.org/
[johnnybgoode]: https://github.com/SwissArmyWrench/johnnybgoode
[jsmin]: https://www.crockford.com/javascript/jsmin.html
[kamal]: https://github.com/basecamp/kamal
[keyscan]: https://github.com/kevinMEH/keyscan
[koino]: https://github.com/kivikakk/koino
[lofloccus]: https://github.com/TCB13/LoFloccus
[mixed-content-scan]: https://github.com/bramus/mixed-content-scan
[nbtscan]: https://github.com/resurrecting-open-source-projects/nbtscan
[nfov@tmp]: https://nrlquaker.github.io/nfov/
[observatory]: https://github.com/mozilla/observatory-cli
[packer-tmp]: https://www.packer.io/
[pd-urlfinder]: https://github.com/projectdiscovery/urlfinder
[pear]: https://github.com/pear-devs/pear-desktop
[penelope]: https://github.com/brightio/penelope
[pprof]: https://github.com/google/pprof
[puncia]: https://github.com/ARPSyndicate/puncia
[regular]: https://github.com/dbohdan/regular
[runtimebrowser]: https://github.com/nst/RuntimeBrowser
[seclists]: https://github.com/danielmiessler/SecLists
[spacestation14]: https://spacestation14.com/
[tidy]: https://github.com/sts10/tidy
[tuckr]: https://github.com/RaphGL/Tuckr
[typst-ansi-hl]: https://github.com/frozolotl/typst-ansi-hl
[unarj]: http://www.arjsoftware.com/files.htm
[volatility]: https://github.com/volatilityfoundation/volatility3
[wafw00f]: https://github.com/EnableSecurity/wafw00f
[withjava]: https://git.arielaw.ar/arisunz/with-java
[wmiexec-pro]: https://github.com/XiaoliChan/wmiexec-Pro
[wordlists]: https://gitlab.com/kalilinux/packages/wordlists
[wordtidy]: https://github.com/sts10/tidy

## License

This repo is licensed under the [BSD 2-Clause License].

See the [LICENSE](LICENSE) file for details.
