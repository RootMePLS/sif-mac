{ config, lib, pkgs, ... }:

{
  services = {
    yabai = {                             # Tiling window manager
      enable = true;
      package = pkgs.yabai;
      config = {                          # Other configuration options
        mouse_follows_focus =           "off";
        focus_follows_mouse =           "off";
        window_origin_display =         "default";
        window_placement =              "second_child";
        window_zoom_persist =           "on";
        window_topmost =                "off";
        window_shadow =                 "on";
        window_animation_duration =     "0.0";
        window_animation_frame_rate =   "120";
        window_opacity_duration =       "0.0";
        active_window_opacity =         "1.0";
        normal_window_opacity =         "0.90";
        window_opacity =                "off";
        insert_feedback_color =         "0xffd75f5f";
        active_window_border_color =    "0xff775759";
        normal_window_border_color =    "0xff555555";
        window_border_width =           "4";
        window_border_radius =          "12";
        window_border_blur =            "off";
        window_border_hidpi =           "on";
        window_border =                 "off";
        split_ratio =                   "0.50";
        split_type =                    "auto";
        auto_balance =                  "off";
        top_padding =                   "12";
        bottom_padding =                "12";
        left_padding =                  "12";
        right_padding =                 "12";
        window_gap =                    "06";
        layout =                        "bsp";
        mouse_modifier =                "fn";
        mouse_action1 =                 "move";
        mouse_action2 =                 "resize";
        mouse_drop_action =             "swap";
      };
      exterConfig = ''
        # load scripting addition
        sudo yabai --load-sa
        yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

        # bar configuration
        yabai -m config external_bar all:0:39
        yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"

        # borders
        yabai -m config window_border on
        yabai -m config window_border_width 2
        yabai -m config window_border_radius 0
        yabai -m config window_border_blur off
        yabai -m config active_window_border_color 0xFF40FF00
        yabai -m config normal_window_border_color 0x00FFFFFF
        yabai -m config insert_feedback_color 0xffd75f5f

        yabai -m config window_shadow off

        # layout
        yabai -m config layout bsp
        yabai -m config auto_balance off
        yabai -m config window_topmost on

        # gaps
        yabai -m config top_padding    0
        yabai -m config bottom_padding 0
        yabai -m config left_padding   0
        yabai -m config right_padding  0
        yabai -m config window_gap     0

        # rules
        yabai -m rule --add app="^System Settings$" manage=off

        # workspace management
        yabai -m space 1 --label term
        yabai -m space 2 --label code
        yabai -m space 3 --label www
        yabai -m space 4 --label chat
        yabai -m space 5 --label todo
        yabai -m space 6 --label music
        yabai -m space 7 --label voice
        yabai -m space 8 --label eight
        yabai -m space 9 --label nine
        yabai -m space 10 --label ten

        # assign apps to spaces
        yabai -m rule --add app="Alacritty" space=code
        yabai -m rule --add app="Visual Studio Code" space=code

        yabai -m rule --add app="Vivaldi" space=www

        yabai -m rule --add app="Slack" space=chat
        yabai -m rule --add app="Signal" space=chat

        yabai -m rule --add app="Todoist" space=todo

        yabai -m rule --add app="Spotify" space=music

        yabai -m rule --add app="Mumble" space=voice

        yabai -m rule --add app="Google Chrome" space=eight

        yabai -m rule --add app="Microsoft Teams" space=nine

        echo "yabai configuration loaded.."
      '';
    };
  };
}