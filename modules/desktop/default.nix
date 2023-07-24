{ config, pkgs, username, ... }:

{
  imports = [
    ./sketchybar.nix
    ./yabai.nix
    ./skhd.nix
  ];
}