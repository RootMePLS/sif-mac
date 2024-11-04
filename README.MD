
# Nix + macOS

## Preparation

- Load your mac in Recovery mode
  - Press and hold the power button on your Mac until “Loading startup options” appears. Click Options, then click Continue.
  - In the menu bar, choose Utilities, then Terminal
  - `csrutil enable --without fs --without debug --without nvram`
  - Reboot
- Open a terminal and run command `sudo nvram boot-args=-arm64e_preview_abi`
- Reboot
- Run `csrutil status`, which returns `System Integrity Protection status: disabled`. if it is turned off (it may show `unknown` for newer versions of macOS when disabling SIP partially)
- If you ever want to re–enable System Integrity Protection after uninstalling yabai; repeat the steps above, but run `csrutil enable` instead of `csrutil enable --without fs --without debug --without nvram`

## Install Nix package manager

- Install Nix
`sh <(curl -L https://nixos.org/nix/install)`
- Configure it

  ```bash
  mkdir -p ~/.config/nix
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

  git clone https://github.com/fishhead108/sif-mac ~/.setup
  cd ~/.setup
  ```

## Deploy config

```bash
nix build .#darwinConfigurations.dm-laptop.system
./result/sw/bin/darwin-rebuild switch --flake .#dm-laptop
```

## Rebuild

- `darwin-rebuild switch --flake .#dm-laptop`
- Put `~/.nix-profile/bin` on my PATH

## Tunning

- Turn off macOS ssh agent if you working with 1password
  `launchctl disable gui/$UID/com.openssh.ssh-agent`


- https://felixkratz.github.io/SketchyBar/setup#hiding-the-original-macos-bar
- https://www.josean.com/posts/yabai-setup
- https://evantravers.com/articles/2024/02/15/yabai-tiling-window-management-for-osx/
- https://github.com/LnL7/nix-darwin/issues/913
- https://home-manager-options.extranix.com/