{ inputs, ... }:
let
  folder = "${inputs.sketchybar}/config/sketchybar";
in
{
  home.file.plugins-laptop-battery = {
    executable = true;
    target = "${folder}/plugins-laptop/battery.sh";
    text = ''
      #!/usr/bin/env sh

      # Battery is here bcause the ICON_COLOR doesn't play well with all background colors

      PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
      CHARGING=$(pmset -g batt | grep 'AC Power')

      if [ $PERCENTAGE = "" ]; then
          exit 0
      fi

      case ${PERCENTAGE} in
      [8-9][0-9] | 100)
          ICON=""
          ICON_COLOR=0xffa6da95
          ;;
      7[0-9])
          ICON=""
          ICON_COLOR=0xffeed49f
          ;;
      [4-6][0-9])
          ICON=""
          ICON_COLOR=0xfff5a97f
          ;;
      [1-3][0-9])
          ICON=""
          ICON_COLOR=0xffee99a0
          ;;
      [0-9])
          ICON=""
          ICON_COLOR=0xffed8796
          ;;
      esac

      if [[ $CHARGING != "" ]]; then
          ICON=""
          ICON_COLOR=0xffeed49f
      fi

      sketchybar --set $NAME \
          icon=$ICON \
          label="${PERCENTAGE}%" \
          icon.color=${ICON_COLOR}
    '';
  };

  home.file.plugins-laptop-spotify = {
    executable = true;
    target = "${folder}/plugins-laptop/spotify.sh";
    text = ''
      #!/usr/bin/env zsh

      # Max number of characters so it fits nicely to the right of the notch
      # MAY NOT WORK WITH NON-ENGLISH CHARACTERS

      MAX_LENGTH=35

      # Logic starts here, do not modify
      HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))

      # Spotify JSON / $INFO comes in malformed, line below sanitizes it
      SPOTIFY_JSON="$INFO"

      update_track() {

          if [[ -z $SPOTIFY_JSON ]]; then
              sketchybar --set $NAME icon.color=0xffeed49f label.drawing=no
              return
          fi

          PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

          if [ $PLAYER_STATE = "Playing" ]; then
              TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
              ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

              # Calculations so it fits nicely
              TRACK_LENGTH=${#TRACK}
              ARTIST_LENGTH=${#ARTIST}

              if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
                  # If the total length exceeds the max
                  if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                      # If both the track and artist are too long, cut both at half length - 1

                      # If MAX_LENGTH is odd, HALF_LENGTH is calculated with an extra space, so give it an extra char
                      TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
                      ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"

                  elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
                      # Else if only the track is too long, cut it by the difference of the max length and artist length
                      TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
                  elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                      ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
                  fi
              fi
              sketchybar --set $NAME label="${TRACK}  ${ARTIST}" label.drawing=yes icon.color=0xffa6da95

          elif [ $PLAYER_STATE = "Paused" ]; then
              sketchybar --set $NAME icon.color=0xffeed49f
          elif [ $PLAYER_STATE = "Stopped" ]; then
              sketchybar --set $NAME icon.color=0xffeed49f label.drawing=no
          else
              sketchybar --set $NAME icon.color=0xffeed49f
          fi
      }

      case "$SENDER" in
      "mouse.clicked")
          osascript -e 'tell application "Spotify" to playpause'
          ;;
      *)
          update_track
          ;;
      esac
    '';
  };
}
