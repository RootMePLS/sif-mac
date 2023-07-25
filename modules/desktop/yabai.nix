{ config, lib, pkgs, ... }:

{
  services = {
    # Tiling window manager
    # You can find options description here: https://github.com/koekeishiya/yabai/wiki/Configuration#tiling-options
    yabai = {
      enable = true;
      package = pkgs.yabai;
      enableScriptingAddition = true;
      config = {
        # layout = "stack";
        # auto_balance = "off";
        split_ratio = "0.50";
        # window_border = "off";
        # window_border_width = "2";
        window_placement = "second_child";
        focus_follows_mouse = "autoraise";
        mouse_follows_focus = "off";
        top_padding = "0";
        bottom_padding = "0";
        left_padding = "0";
        right_padding = "0";
        window_gap = "0";
      };
      extraConfig = ''

        # bar configuration
        yabai -m config external_bar all:0:39
        yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"


        # borders
        yabai -m config window_border off
        yabai -m config window_border_width 2
        yabai -m config window_border_radius 0
        yabai -m config window_border_blur off
        yabai -m config active_window_border_color 0xFF40FF00
        yabai -m config normal_window_border_color 0x00FFFFFF
        yabai -m config insert_feedback_color 0xffd75f5f

        yabai -m config window_shadow off

        # layout
        yabai -m config layout stack
        yabai -m config auto_balance off
        yabai -m config window_topmost on
        
        # workspace management
        yabai -m space 1 --label term
        yabai -m space 2 --label www
        yabai -m space 3 --label code
        yabai -m space 4 --label chat
        yabai -m space 5 --label music
        yabai -m space 6 --label six
        yabai -m space 7 --label seven
        yabai -m space 8 --label eight
        yabai -m space 9 --label nine
        yabai -m space 10 --label ten

        # assign apps to spaces
        yabai -m rule --add app="Terminal" space=term
        yabai -m rule --add app="Alacritty" space=term

        yabai -m rule --add app="Firefox" space=www
        yabai -m rule --add app="Google Chrome" space=www

        yabai -m rule --add app="Visual Studio Code" space=code

        yabai -m rule --add app="Slack" space=chat
        yabai -m rule --add app="Zoom" space=chat
        yabai -m rule --add app="Discord" space=chat
        yabai -m rule --add app="Telegram" space=chat
        yabai -m rule --add app="Microsoft Teams" space=chat
        
        yabai -m rule --add app="Spotify" space=music
        

        yabai -m rule --add app='^Emacs$' manage=on
        yabai -m rule --add title='Preferences' manage=off layer=above
        yabai -m rule --add title='^(Opening)' manage=off layer=above
        yabai -m rule --add title='Library' manage=off layer=above
        yabai -m rule --add app='^System Preferences$' manage=off layer=above
        yabai -m rule --add app='Activity Monitor' manage=off layer=above
        yabai -m rule --add app='Finder' manage=off layer=above
        yabai -m rule --add app='^System Information$' manage=off layer=above
      '';
    };
  };
}
