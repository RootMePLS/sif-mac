{ username, ... }:
let
  folder = "/Users/${username}/.config/sketchybar";
in
{
  home.file.sketchybarrc-desktop = {
    executable = true;
    target = "${folder}/sketchybarrc-desktop";
    text = ''
      #!/usr/bin/env zsh

      source "$CONFIG_DIR/colors.sh" # Loads all defined colors
      source "$CONFIG_DIR/icons.sh" # Loads all defined icons

      # FONT_FACE="JetBrainsMono Nerd Font"

      ITEM_DIR="$CONFIG_DIR/items"
      PLUGIN_DIR="$CONFIG_DIR/plugins"
      # PLUGIN_SHARED_DIR="$CONFIG_DIR/plugins"

      SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

      FONT="SF Pro" # Needs to have Regular, Bold, Semibold, Heavy and Black variants
      PADDINGS=3 # All paddings use this value (icon, label, background)

      # aerospace setting
      AEROSPACE_FOCUSED_MONITOR_NO=$(aerospace list-workspaces --focused)
      AEROSPACE_LIST_OF_WINDOWS_IN_FOCUSED_MONITOR=$(aerospace list-windows --workspace $AEROSPACE_FOCUSED_MONITOR_NO | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

      # Unload the macOS on screen indicator overlay for volume change
      launchctl unload -F /System/Library/LaunchAgents/com.apple.OSDUIHelper.plist > /dev/null 2>&1 &

      # Setting up the general bar appearance of the bar
      bar=(
        height=23
        color=$BAR_COLOR
        shadow=on
        position=top
        sticky=on
        padding_right=10
        padding_left=10
        corner_radius=9
        y_offset=3
        margin=10
        blur_radius=20
        notch_width=200
      )

      sketchybar --bar "''${bar[@]}"

      # Setting up default values
      defaults=(
        updates=when_shown
        icon.font="$FONT:Regular:14.0"
        icon.color=$ICON_COLOR
        icon.padding_left=$PADDINS
        icon.padding_right=$PADDINGS
        label.font="$FONT:Semibold:13.0"
        label.color=$LABEL_COLOR
        label.padding_left=$PADDINGS
        label.padding_right=$PADDINGS
        label.shadow.drawing=on
        label.shadow.distance=2
        label.shadow.color=0xff000000
        padding_right=$PADDINGS
        padding_left=$PADDINGS
        background.height=26
        background.corner_radius=9
        background.border_width=2
        popup.background.border_width=2
        popup.background.corner_radius=9
        popup.background.border_color=$POPUP_BORDER_COLOR
        popup.background.color=$POPUP_BACKGROUND_COLOR
        popup.blur_radius=20
        popup.background.shadow.drawing=on
        scroll_texts=on

      )

      sketchybar --default "''${defaults[@]}"

      ##### Finalizing Setup #####
      source "$ITEM_DIR/apple.sh"
      source "$ITEM_DIR/spaces.sh"
      sketchybar --hotload on
      # Forcing all item scripts to run (never do this outside of sketchybarrc)
      sketchybar --update
      echo "sketchybar configuation loaded.."
    '';
  };
}
