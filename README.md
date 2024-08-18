# `homebrew-tap` - Homebrew taps and formulae! 💎

[Homebrew] taps for [Neved4]'s utilities.

## Formulae & Casks

<!-- START SYNC -->

[<kbd>awk</kbd>]: https://github.com/onetrueawk/awk
[<kbd>c</kbd>]: https://www.iso.org/standard/74528.html
[<kbd>go</kbd>]: https://go.dev/
[<kbd>iso-8601</kbd>]: https://www.iso.org/iso-8601-date-and-time-format.html
[<kbd>fish-shell</kbd>]: https://fishshell.com/
[<kbd>posix-shell</kbd>]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
[<kbd>tz-database</kbd>]: https://www.iana.org/time-zones
[<kbd>objective-c</kbd>]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html
[<kbd>python</kbd>]: https://www.python.org
[<kbd>python</kbd>]: https://www.python.org
[<kbd>swift</kbd>]: https://developer.apple.com/swift/
[<kbd>rust</kbd>]: https://www.rust-lang.org/
[<kbd>javascript</kbd>]: https://ecma-international.org/publications-and-standards/standards/ecma-262/
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

- [twc] [<kbd>c</kbd>] [<kbd>iso-8601</kbd>] [<kbd>tz-database</kbd>] Displays time zones using the tz database.
- [gotwc] [<kbd>go</kbd>] [<kbd>iso-8601</kbd>] [<kbd>tz-database</kbd>]
Go version, display different time zones from the tz database.

<!-- END SYNC -->

### External & Third-party 🍺

- [alire] [<kbd>ada</kbd>]
Ada/SPARK package manager.
- [Cinny] [<kbd>javascript</kbd>] [<kbd>rust</kbd>]
Yet another matrix client for desktop.
- [volatility] [<kbd>python</kbd>]  
Advanced memory forensics framework.

[alire]: https://github.com/alire-project/alire
[Cinny]: https://github.com/cinnyapp/cinny-desktop
[volatility]: https://github.com/volatilityfoundation/volatility

## Getting Started

To install any of the formulas above, use the following command:

```sh
brew install Neved4/tap/<name>
```

## License

This repo is licensed under the terms of the [MIT License].

See the [LICENSE](LICENSE) file for details.
