{ config, pkgs, user, ... }:

{
  imports = [
    # ./modules/sketchybar.nix
    ./modules/yabai.nix
    ./modules/skhd.nix
  ];
}