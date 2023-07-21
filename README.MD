# macOS Nix config

## Min

- https://github.com/cmacrae/spacebar
- https://github.com/FelixKratz/SketchyBar
- https://github.com/chipsenkbeil/choose
- https://github.com/koekeishiya/yabai
- https://github.com/AdamWagner/stackline

## Tools

- https://github.com/objective-see/LuLu
- https://tripmode.ch/
- https://github.com/leits/MeetingBar
- https://github.com/DevUtilsApp/DevUtils-app
- https://github.com/azenla/virtual
- https://www.mothersruin.com/software/SuspiciousPackage/
- https://cleanshot.com/
- https://github.com/hmarr/vitals
- https://sindresorhus.com/system-color-picker
- https://github.com/amebalabs/TRex
- https://github.com/lapfelix/BluetoothConnector

## Articles

- https://cmacr.ae/blog/keeping-up-appearances-non-native-macos-light-dark-mode/
- https://cmacr.ae/blog/managing-firefox-on-macos-with-nix/
- https://the-empire.systems/linux-macos-setup

## Configs

- https://github.com/FelixKratz/dotfiles/tree/master
- https://github.com/mitchellh/nixos-config
- https://github.com/MatthiasBenaets/nixos-config
- https://github.com/dustinlyons/nixos-config
- https://github.com/malob/nixpkgs/tree/master/darwin
- https://github.com/srid/nixos-config

```text
only use Homebrew for ‘Casks’ (GUI .apps)— `brew cask` subcommand
don't forget to install GNU coreutils, grep, find, and bash. (BSD coreutils are weird and anemic if you're used to GNU. macOS bash is ancient, etc.)
disable cursor acceleration (barely works, but it's the only thing that works): https://plentycom.jp/en/cursorsense/index.html
recover basic key remapping functionality: https://karabiner-elements.pqrs.org/
recover basic audio controls like per-app volume mixing: https://github.com/kyleneideck/BackgroundMusic
recover FUSE support: https://osxfuse.github.io/
recover clipboard management: https://hluk.github.io/CopyQ/

```
