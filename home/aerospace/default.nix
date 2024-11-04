{ device_type, config, pkgs, username, inputs, ... }:
{
  imports = if device_type == "desktop" then
    [ ./aerospace-desktop.nix ]
  else
    [ ./aerospace-laptop.nix ];
}
