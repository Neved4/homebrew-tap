# `homebrew-tap` - Homebrew taps and formulae! 💎

[Homebrew] taps for [Neved4]'s patches & utilities.

> [!IMPORTANT]
> Packages are updated _monthly_.

## Formulae & Casks 🍺

<!-- START SYNC -->

[<kbd>ada</kbd>]: https://www.adacore.com/about-ada
[<kbd>awk</kbd>]: https://github.com/onetrueawk/awk
[<kbd>c++</kbd>]: https://isocpp.org
[<kbd>c</kbd>]: https://www.c-language.org/
[<kbd>fish-shell</kbd>]: https://fishshell.com/
[<kbd>go</kbd>]: https://go.dev/
[<kbd>iso-8601</kbd>]: https://www.iso.org/iso-8601-date-and-time-format.html
[<kbd>java</kbd>]: https://dev.java/
[<kbd>javascript</kbd>]: https://ecma-international.org/publications-and-standards/standards/ecma-262/
[<kbd>objective-c</kbd>]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html
[<kbd>posix-shell</kbd>]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
[<kbd>python</kbd>]: https://www.python.org
[<kbd>ruby</kbd>]: https://www.ruby-lang.org/en/
[<kbd>rust</kbd>]: https://www.rust-lang.org/
[<kbd>swift</kbd>]: https://www.swift.org/
[<kbd>typescript</kbd>]: https://www.typescriptlang.org/
[<kbd>tz-database</kbd>]: https://www.iana.org/time-zones
[<kbd>zig</kbd>]: https://ziglang.org/

[Homebrew]: https://brew.sh/
[MIT License]: https://opensource.org/license/mit/
[Neved4]: https://github.com/Neved4
[applist]: https://github.com/Neved4/applist
[apputils]: https://github.com/Neved4/apputils
[sw_name]: https://github.com/Neved4/sw_name
[tmbackup]: https://github.com/Neved4/tmbackup
[tmexcludes]: https://github.com/Neved4/tmexcludes
[gotwc]: https://github.com/Neved4/gotwc
[twc]: https://github.com/Neved4/twc

### macOS 

- [applist] [<kbd>objective-c</kbd>] [<kbd>swift</kbd>] [<kbd>posix-shell</kbd>]
  List the paths to all installed apps in macOS .
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

<!-- END SYNC -->

## External & Third-party 🍻

### Formula

- [alire] [<kbd>ada</kbd>]
  Ada/SPARK package manager.
- [apfs-clone-checker] [<kbd>c</kbd>]
  Utility to check if two files are APFS clones.
- [apg-go] [<kbd>go</kbd>]
  A modern "Automated Password Generator"-clone written in Go.
- [center] [<kbd>c</kbd>]
  Centers text read from stdin.
- [demagnetize] [<kbd>python</kbd>]
  Convert magnet links to .torrent files.
- [demagnetize-rs] [<kbd>rust</kbd>]
  Convert magnet links to .torrent files.
- [dgen] [<kbd>c</kbd>]
  Sega Genesis / Mega Drive emulator.
- [hyperspec]
  Common Lisp ANSI-standard Hyperspec.
- [johnnybgoode] [<kbd>rust</kbd>]
  An assistant for users of the Johnny Decimal file organization system.
- [jsmin] [<kbd>c</kbd>]
  Minify JavaScript code.
- [koino] [<kbd>zig</kbd>]
  CommonMark + GFM compatible Markdown parser and renderer
- [packer-tmp] [<kbd>go</kbd>]
  Tool for creating identical machine images for multiple platforms.
- [puncia] [<kbd>python</kbd>]
  Official CLI utility for Osprey Vision, Subdomain Center & Exploit Observer.
- [regular] [<kbd>typescript</kbd>]
  Job scheduler: an alternative to cron and anacron.
- [typst-ansi-hl] [<kbd>go</kbd>]
  Highlight your Typst code using ANSI escape sequences.
- [unarj] [<kbd>c</kbd>]
  ARJ file archiver.
- [pd-urlfinder] [<kbd>go</kbd>]
  Tool for passively gathering URLs.
- [volatility] [<kbd>python</kbd>]
  Advanced memory forensics framework.
- [withjava] [<kbd>rust</kbd>]
  Wrap commands in specific Java versions.
- [wordtidy] [<kbd>rust</kbd>]
  Combine and clean word lists.

### Casks

- [chromium@api] [<kbd>c++</kbd>]
  Chromium web browser, with API features enabled.
- [burp-browser] [<kbd>c++</kbd>]
  Chromium stable, from Burp Browser.
- [cinny] [<kbd>javascript</kbd>] [<kbd>rust</kbd>]
  Yet another matrix client for desktop.
- [font-monego]
  Monaco monospaced inspired font.
- [freewrite] [<kbd>swift</kbd>]
  Write continuously without distraction.
- [google-chrome-testing] [<kbd>c++</kbd>]
  Google Chrome for Testing override.
- [nfov@tmp] [<kbd>typescript</kbd>]
  ASCII / ANSI art viewer.

[alire]: https://github.com/alire-project/alire
[apfs-clone-checker]: https://github.com/dyorgio/apfs-clone-checker
[apg-go]: https://github.com/wneessen/apg-go
[burp-browser]: https://www.chromium.org/Home/
[center]: https://github.com/LizzyFleckenstein03/center
[chromium@api]: https://www.chromium.org/Home/
[cinny]: https://github.com/cinnyapp/cinny-desktop
[demagnetize-rs]: https://github.com/jwodder/demagnetize-rs
[demagnetize]: https://github.com/jwodder/demagnetize
[dgen]: https://dgen.sourceforge.net/
[font-monego]: https://github.com/cseelus/monego
[freewrite]: https://freewrite.io/
[google-chrome-testing]: https://developer.chrome.com/blog/chrome-for-testing
[hyperspec]: https://www.lispworks.com/documentation/common-lisp.html
[johnnybgoode]: https://github.com/SwissArmyWrench/johnnybgoode
[jsmin]: https://www.crockford.com/javascript/jsmin.html
[koino]: https://github.com/kivikakk/koino
[nfov@tmp]: https://nrlquaker.github.io/nfov/
[packer-tmp]: https://www.packer.io/
[pd-urlfinder]: https://github.com/projectdiscovery/urlfinder
[puncia]: https://github.com/ARPSyndicate/puncia
[regular]: https://github.com/dbohdan/regular
[typst-ansi-hl]: https://github.com/frozolotl/typst-ansi-hl
[unarj]: http://www.arjsoftware.com/files.htm
[volatility]: https://github.com/volatilityfoundation/volatility
[withjava]: https://git.arielaw.ar/arisunz/with-java
[wordtidy]: https://github.com/sts10/tidy

## Getting Started

To install any of the formulas above, use the following command:

```sh
brew install Neved4/tap/<name>
```

## License

This repo is licensed under the terms of the [MIT License].

See the [LICENSE](LICENSE) file for details.
