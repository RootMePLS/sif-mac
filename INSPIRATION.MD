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
- https://cbrgm.net/post/2021-05-5-setup-macos/

## Configs

- https://github.com/mitchellh/nixos-config
- https://github.com/MatthiasBenaets/nixos-config
- https://github.com/dustinlyons/nixos-config
- https://github.com/malob/nixpkgs/tree/master/darwin
- https://github.com/srid/nixos-config
- https://github.com/FelixKratz/dotfiles/tree/master
- https://github.com/yuanw/nix-home
- https://github.com/neutonfoo/dotfiles
- https://github.com/r17x/nixpkgs

### Explore

- https://github.com/tejing1/nixos-config/blob/master/flake.nix
- https://sr.ht/~cfeeley/dotfiles/

```
desktop(){
    vared -p "Show or hide Desktop? (show/hide): " -c SHOWHIDEDESKTOP

    if [[ "$SHOWHIDEDESKTOP" == "hide" ]]; then
        defaults write com.apple.finder CreateDesktop false
        killall Finder

        echo -e "\e[31mDesktop Hidden"
    else
        defaults write com.apple.finder CreateDesktop true
        killall Finder

        echo -e "\e[32mDesktop Visible"
    fi

    SHOWHIDEDESKTOP=""
}
```
