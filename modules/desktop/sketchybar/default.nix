{ username, ... }:

# Based on https://github.com/neutonfoo/dotfiles
#
{
  imports = [
    ./plugins-desktop.nix
    ./plugins-laptop.nix
    ./plugins.nix
    ./sketchybarrc-desktop.nix
    ./sketchybarrc-laptop.nix
    ./sketchybarrc.nix
  ];
}
