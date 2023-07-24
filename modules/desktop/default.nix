{ config, pkgs, username, ... }:

{
  imports = [
    # ./sketchybar
    ./yabai.nix
    ./skhd.nix
  ];
}