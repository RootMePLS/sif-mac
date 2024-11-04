{ config, pkgs, username, inputs, ... }:

# Based on https://github.com/neutonfoo/dotfiles
#
{
  imports = [
    ./plugins-desktop.nix
    ./plugins-laptop.nix
    ./plugins.nix
    ./sketchybarrc-desktop.nix
    # ./sketchybarrc-laptop.nix
    ./sketchybarrc.nix
    ./sketchybar-helpers.nix
    ./items/apple.nix
    ./items/spaces.nix
    ./plugins/icon_map.nix
    ./plugins/space.nix
    ./plugins/space_windows.nix
  ];
}
