{ config, lib, pkgs, ... }:

{
  services = {
    # Hotkey daemon
    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # alt + a / u / o / s are blocked due to umlaute

        # focus window
        alt - h : yabai -m window --focus west

        # swap managed window
        shift + alt - h : yabai -m window --swap north

        # move managed window
        shift + cmd - h : yabai -m window --warp east

        # balance size of windows
        shift + alt - 0 : yabai -m space --balance

        # make floating window fill screen
        shift + alt - up     : yabai -m window --grid 1:1:0:0:1:1

        # make floating window fill left-half of screen
        shift + alt - left   : yabai -m window --grid 1:2:0:0:1:1

        # fast focus desktop
        cmd - x : yabai -m space --focus recent
        cmd - 1 : yabai -m space --focus 1
        cmd - 2 : yabai -m space --focus 2
        cmd - 3 : yabai -m space --focus 3
        cmd - 4 : yabai -m space --focus 4 
        cmd - 5 : yabai -m space --focus 5

        # send window to desktop and follow focus
        shift + cmd - z : yabai -m window --space next; yabai -m space --focus next
        shift + cmd - 2 : yabai -m window --space  2; yabai -m space --focus 2

        # focus monitor
        ctrl + alt - z  : yabai -m display --focus prev
        ctrl + alt - 3  : yabai -m display --focus 3

        # send window to monitor and follow focus
        ctrl + cmd - c  : yabai -m window --display next; yabai -m display --focus next
        ctrl + cmd - 1  : yabai -m window --display 1; yabai -m display --focus 1

        # move floating window
        shift + ctrl - a : yabai -m window --move rel:-20:0
        shift + ctrl - s : yabai -m window --move rel:0:20

        # increase window size
        shift + alt - a : yabai -m window --resize left:-20:0
        shift + alt - w : yabai -m window --resize top:0:-20

        # decrease window size
        shift + cmd - s : yabai -m window --resize bottom:0:-20
        shift + cmd - w : yabai -m window --resize top:0:20

        # set insertion point in focused container
        ctrl + alt - h : yabai -m window --insert west

        # toggle window zoom
        alt - d : yabai -m window --toggle zoom-parent
        alt - f : yabai -m window --toggle zoom-fullscreen

        # toggle window split type
        alt - e : yabai -m window --toggle split

        # float / unfloat window and center on screen
        alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

        # toggle sticky(+float), topmost, picture-in-picture
        alt - p : yabai -m window --toggle sticky --toggle topmost --toggle pip
      '';
    };
  };

}