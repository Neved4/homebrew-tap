# `homebrew-tap` - Homebrew taps and formulae! 💎

[Homebrew] taps for [Neved4]'s utilities.

> [!IMPORTANT]
> Packages are updated _weekly_.

## Formulae & Casks

<!-- START SYNC -->

[<kbd>awk</kbd>]: https://github.com/onetrueawk/awk
[<kbd>c</kbd>]: https://www.iso.org/standard/74528.html
[<kbd>c++</kbd>]: https://isocpp.org
[<kbd>go</kbd>]: https://go.dev/
[<kbd>iso-8601</kbd>]: https://www.iso.org/iso-8601-date-and-time-format.html
[<kbd>fish-shell</kbd>]: https://fishshell.com/
[<kbd>posix-shell</kbd>]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
[<kbd>tz-database</kbd>]: https://www.iana.org/time-zones
[<kbd>objective-c</kbd>]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html
[<kbd>python</kbd>]: https://www.python.org
[<kbd>swift</kbd>]: https://developer.apple.com/swift/
[<kbd>ruby</kbd>]: https://www.ruby-lang.org/en/
[<kbd>rust</kbd>]: https://www.rust-lang.org/
[<kbd>java</kbd>]: https://dev.java/
[<kbd>javascript</kbd>]: https://ecma-international.org/publications-and-standards/standards/ecma-262/
[<kbd>typescript</kbd>]: https://www.typescriptlang.org/
[<kbd>ada</kbd>]: https://www.adacore.com/about-ada
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

### External & Third-party 🍺

- [alire] [<kbd>ada</kbd>]
  Ada/SPARK package manager.
- [babelfish] [<kbd>go</kbd>]
  Translate bash scripts to fish.
- [Chromium] [<kbd>c++</kbd>]
  Chromium web browser, with API keys loaded.
- [Cinny] [<kbd>javascript</kbd>] [<kbd>rust</kbd>]
  Yet another matrix client for desktop.
- [comrak] [<kbd>rust</kbd>]
  CommonMark + GFM compatible Markdown parser and renderer.
- [demagnetize] [<kbd>python</kbd>]
  Convert magnet links to .torrent files.
- [demagnetize-rs] [<kbd>rust</kbd>]
  Convert magnet links to .torrent files.
- [doas] [<kbd>c</kbd>]
  Execute commands as another user.
- [font-monego]
  The beloved Monaco monospaced font, recreated with bold and italic variants.
- [johnnybgoode] [<kbd>rust</kbd>]
  An assistant for users of the Johnny Decimal file organization system.
- [Ladybird] [<kbd>c++</kbd>]
  Truly independent web browser.
- [nfov] [<kbd>typescript</kbd>]
  ASCII / ANSI art viewer.
- [typst-ansi-hl] [<kbd>rust</kbd>]
  Highlight your Typst code using ANSI escape sequences.
- [ungoogled-chromium] [<kbd>c++</kbd>]
  Google Chromium, sans integration with Google.
- [volatility] [<kbd>python</kbd>]
  Advanced memory forensics framework.
- [withjava] [<kbd>rust</kbd>]
  Wrap commands in specific Java versions.
- [wordtidy] [<kbd>rust</kbd>]
  Combine and clean word lists.

[alire]: https://github.com/alire-project/alire
[babelfish]: https://github.com/bouk/babelfish
[Chromium]: https://www.chromium.org/Home/
[Cinny]: https://github.com/cinnyapp/cinny-desktop
[comrak]: https://github.com/kivikakk/comrak
[demagnetize]: https://github.com/jwodder/demagnetize
[demagnetize-rs]: https://github.com/jwodder/demagnetize-rs
[doas]: https://github.com/slicer69/doas
[font-monego]: https://github.com/cseelus/monego
[johnnybgoode]: https://github.com/SwissArmyWrench/johnnybgoode
[ladybird]: https://ladybird.org/
[nfov]: https://nrlquaker.github.io/nfov/
[typst-ansi-hl]: https://github.com/frozolotl/typst-ansi-hl
[ungoogled-chromium]: https://github.com/ungoogled-software/ungoogled-chromium
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
