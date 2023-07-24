{ inputs, ... }:
let
  folder = "${inputs.sketchybar}/config/sketchybar";
in
{
  home.file.plugins-clock = {
    executable = true;
    target = "${folder}/plugins/clock.sh";
    text = ''
      #!/usr/bin/env zsh

      sketchybar --set $NAME label="$(date '+%a %b %-d %-H:%M')"
    '';
  };

  home.file.plugins-current-space = {
    executable = true;
    target = "${folder}/plugins/current_space.sh";
    text = ''
      #!/usr/bin/env zsh

      update_space() {
          SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

          case $SPACE_ID in
          1)
              ICON=󰅶
              ICON_PADDING_LEFT=7
              ICON_PADDING_RIGHT=7
              ;;
          *)
              ICON=$SPACE_ID
              ICON_PADDING_LEFT=9
              ICON_PADDING_RIGHT=10
              ;;
          esac

          sketchybar --set $NAME \
              icon=$ICON \
              icon.padding_left=$ICON_PADDING_LEFT \
              icon.padding_right=$ICON_PADDING_RIGHT
      }

      case "$SENDER" in
      "mouse.clicked")
          # Reload sketchybar
          sketchybar --remove '/.*/'
          source $HOME/.config/sketchybar/sketchybarrc
          ;;
      *)
          update_space
          ;;
      esac
    '';
  };

  home.file.plugins-front-app = {
    executable = true;
    target = "${folder}/plugins/front_app.sh";
    text = ''
      #!/usr/bin/env zsh

      ICON_PADDING_RIGHT=5

      case $INFO in
      "Arc")
          ICON_PADDING_RIGHT=5
          ICON=󰞍
          ;;
      "Code")
          ICON_PADDING_RIGHT=4
          ICON=󰨞
          ;;
      "Calendar")
          ICON_PADDING_RIGHT=3
          ICON=
          ;;
      "Discord")
          ICON=󰙯
          ;;
      "FaceTime")
          ICON_PADDING_RIGHT=5
          ICON=
          ;;
      "Finder")
          ICON=
          ;;
      "Google Chrome")
          ICON_PADDING_RIGHT=7
          ICON=
          ;;
      "IINA")
          ICON_PADDING_RIGHT=4
          ICON=󰕼
          ;;
      "kitty")
          ICON=󰄛
          ;;
      "Messages")
          ICON=󰍦
          ;;
      "Notion")
          ICON_PADDING_RIGHT=6
          ICON=󰈄
          ;;
      "Preview")
          ICON_PADDING_RIGHT=3
          ICON=
          ;;
      "PS Remote Play")
          ICON_PADDING_RIGHT=3
          ICON=
          ;;
      "Spotify")
          ICON=
          ;;
      "TextEdit")
          ICON_PADDING_RIGHT=4
          ICON=
          ;;
      "Transmission")
          ICON_PADDING_RIGHT=3
          ICON=󰶘
          ;;
      *)
          ICON=﯂
          ;;
      esac

      sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
      sketchybar --set $NAME.name label="$INFO"
    '';
  };

  home.file.plugins-volume = {
    executable = true;
    target = "${folder}/plugins/volume.sh";
    text = ''
      #!/usr/bin/env zsh

      case ${INFO} in
      0)
          ICON=""
          ICON_PADDING_RIGHT=21
          ;;
      [0-9])
          ICON=""
          ICON_PADDING_RIGHT=12
          ;;
      *)
          ICON=""
          ICON_PADDING_RIGHT=6
          ;;
      esac

      sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$INFO%"
    '';
  };

  home.file.plugins-weather = {
    executable = true;
    target = "${folder}/plugins/weather.sh";
    text = ''
      #!/usr/bin/env zsh

      IP=$(curl -s https://ipinfo.io/ip)
      LOCATION_JSON=$(curl -s https://ipinfo.io/$IP/json)

      LOCATION="$(echo $LOCATION_JSON | jq '.city' | tr -d '"')"
      REGION="$(echo $LOCATION_JSON | jq '.region' | tr -d '"')"
      COUNTRY="$(echo $LOCATION_JSON | jq '.country' | tr -d '"')"

      # Line below replaces spaces with +
      LOCATION_ESCAPED="${LOCATION// /+}+${REGION// /+}"
      WEATHER_JSON=$(curl -s "https://wttr.in/$LOCATION_ESCAPED?format=j1")

      # Fallback if empty
      if [ -z $WEATHER_JSON ]; then

          sketchybar --set $NAME label=$LOCATION
          sketchybar --set $NAME.moon icon=

          return
      fi

      TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
      WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')
      MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')

      case ${MOON_PHASE} in
      "New Moon")
          ICON=
          ;;
      "Waxing Crescent")
          ICON=
          ;;
      "First Quarter")
          ICON=
          ;;
      "Waxing Gibbous")
          ICON=
          ;;
      "Full Moon")
          ICON=
          ;;
      "Waning Gibbous")
          ICON=
          ;;
      "Last Quarter")
          ICON=
          ;;
      "Waning Crescent")
          ICON=
          ;;
      esac

      sketchybar --set $NAME label="$LOCATION  $TEMPERATURE糖 $WEATHER_DESCRIPTION"
      sketchybar --set $NAME.moon icon=$ICON
    '';
  };
}
