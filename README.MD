# steps

- Install Nix
`sh <(curl -L https://nixos.org/nix/install)`
- Configure it

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

git clone https://github.com/fishhead108/sif-mac ~/.setup
cd ~/.setup
nix build .#darwinConfigurations.dm-laptop.system
./result/sw/bin/darwin-rebuild switch --flake .#dm-laptop
```

## Rebuild

- darwin-rebuild switch --flake .#dm-laptop
- Put `~/.nix-profile/bin` on my PATH