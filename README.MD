# steps

- Install Nix
`sh <(curl -L https://nixos.org/nix/install)`
- Configure it

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

git clone https://github.com/fishhead108/sif-mac ~/.setup
cd ~/.setup
nix build .#darwinConfigurations.dmiroshnichenko-laptop.system
./result/sw/bin/darwin-rebuild switch --flake .#dmiroshnichenko-laptop
```

## Rebuild

- darwin-rebuild switch --flake .#dmiroshnichenko-laptop
- Put `~/.nix-profile/bin` on my PATH


## Preparation

- https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection#what-is-system-integrity-protection-and-why-does-it-need-to-be-disabled
- https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)#configure-scripting-addition
- https://felixkratz.github.io/SketchyBar/setup#hiding-the-original-macos-bar