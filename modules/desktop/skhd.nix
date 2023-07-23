{ config, lib, pkgs, ... }:

{
  services = {
    skhd = {                              # Hotkey daemon
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # alt + a / u / o / s are blocked due to umlaute

        # workspaces
        ctrl + alt - j : ${pkgs.yabai} -m space --focus prev
        ctrl + alt - k : ${pkgs.yabai} -m space --focus next
        cmd + alt - j : ${pkgs.yabai} -m space --focus prev
        cmd + alt - k : ${pkgs.yabai} -m space --focus next

        # send window to space and follow focus
        ctrl + alt - l : ${pkgs.yabai} -m window --space prev; ${pkgs.yabai} -m space --focus prev
        ctrl + alt - h : ${pkgs.yabai} -m window --space next; ${pkgs.yabai} -m space --focus next
        cmd + alt - l : ${pkgs.yabai} -m window --space prev; ${pkgs.yabai} -m space --focus prev
        cmd + alt - h : ${pkgs.yabai} -m window --space next; ${pkgs.yabai} -m space --focus next

        # focus window
        alt - h : ${pkgs.yabai} -m window --focus west
        alt - l : ${pkgs.yabai} -m window --focus east

        # focus window in stacked
        alt - j : if [ "$(${pkgs.yabai} -m query --spaces --space | jq -r '.type')" = "stack" ]; then ${pkgs.yabai} -m window --focus stack.next; else ${pkgs.yabai} -m window --focus south; fi
        alt - k : if [ "$(${pkgs.yabai} -m query --spaces --space | jq -r '.type')" = "stack" ]; then ${pkgs.yabai} -m window --focus stack.prev; else ${pkgs.yabai} -m window --focus north; fi

        # swap managed window
        shift + alt - h : ${pkgs.yabai} -m window --swap west
        shift + alt - j : ${pkgs.yabai} -m window --swap south
        shift + alt - k : ${pkgs.yabai} -m window --swap north
        shift + alt - l : ${pkgs.yabai} -m window --swap east

        # increase window size
        shift + alt - a : ${pkgs.yabai} -m window --resize left:-20:0
        shift + alt - s : ${pkgs.yabai} -m window --resize right:-20:0

        # toggle layout
        alt - t : ${pkgs.yabai} -m space --layout bsp
        alt - d : ${pkgs.yabai} -m space --layout stack

        # float / unfloat window and center on screen
        alt - n : ${pkgs.yabai} -m window --toggle float; \
                  ${pkgs.yabai} -m window --grid 4:4:1:1:2:2

        # toggle sticky(+float), topmost, picture-in-picture
        alt - p : ${pkgs.yabai} -m window --toggle sticky; \
                  ${pkgs.yabai} -m window --toggle topmost; \
                  ${pkgs.yabai} -m window --toggle pip

        # reload
        shift + alt - r : brew services restart skhd; brew services restart yabai; brew services restart sketchybar
      '';                                 # Hotkey config
    };
  };

}