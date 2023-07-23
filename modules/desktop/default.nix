{ config, pkgs, user, ... }:

{
  imports = [
    # ./sketchybar.nix
    ./yabai.nix
    ./skhd.nix
  ];
}