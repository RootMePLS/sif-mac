{ config, pkgs, user, ... }:

{
  imports = [
    ./sketchybar
    ./yabai.nix
    ./skhd.nix
  ];
}