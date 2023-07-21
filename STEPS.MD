# steps

- install Nix
`sh <(curl -L https://nixos.org/nix/install)`
- cfg

```bash
mkdir ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

nix-shell -p git
git clone https://github.com/fishhead108/sif-mac ~/.setup
cd ~/.setup
nix build .#darwinConfigurations.dm-laptop.system
./result/sw/bin/darwin-rebuild switch --flake .#dm-laptop
```

## Rebuild

- darwin-rebuild switch --flake .#dm-laptop
- Put `~/.nix-profile/bin` on my PATH