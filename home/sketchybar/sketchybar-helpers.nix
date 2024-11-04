{ username, ... }:
let
  folder = "/Users/${username}/.config/sketchybar";
in
{
  home.file.sketchybar-helpers-colors = {
    executable = true;
    target = "${folder}/colors.sh";
    text = ''
      #!/usr/bin/env zsh
      # Color Palette
      export BLACK=0xff181926
      export WHITE=0xffcad3f5
      export RED=0xffed8796
      export GREEN=0xffa6da95
      export BLUE=0xff8aadf4
      export YELLOW=0xffeed49f
      export ORANGE=0xfff5a97f
      export MAGENTA=0xffc6a0f6
      export GREY=0xff939ab7
      export TRANSPARENT=0x00000000
      export BG0=0xff1e1e2e
      export BG1=0x603c3e4f
      export BG2=0x60494d64

      export BATTERY_1=0xffa6da95
      export BATTERY_2=0xffeed49f
      export BATTERY_3=0xfff5a97f
      export BATTERY_4=0xffee99a0
      export BATTERY_5=0xffed8796

      # General bar colors
      export BAR_COLOR=$BG0
      export BAR_BORDER_COLOR=$BG2
      export BACKGROUND_1=$BG1
      export BACKGROUND_2=$BG2
      export ICON_COLOR=$WHITE # Color of all icons
      export LABEL_COLOR=$WHITE # Color of all labels
      export POPUP_BACKGROUND_COLOR=$BAR_COLOR
      export POPUP_BORDER_COLOR=$WHITE
      export SHADOW_COLOR=$BLACK
    '';
  };
  home.file.sketchybar-helpers-icons = {
    executable = true;
    target = "${folder}/icons.sh";
    text = ''
      #!/usr/bin/env zsh
      export ICON_CMD=󰘳
      export ICON_COG=󰒓 # system settings, system information, tinkertool
      export ICON_CHART=󱕍 # activity monitor, btop
      export ICON_LOCK=󰌾

      export ICONS_SPACE=(󰎤 󰎧 󰎪 󰎭 󰎱 󰎳 󰎶)

      export ICON_APP=󰣆 # fallback app
      export ICON_TERM=󰆍 # fallback terminal app, terminal, warp, iterm2
      export ICON_PACKAGE=󰏓 # brew
      export ICON_DEV=󰅨 # nvim, neovide, xcode, vscode, intellij
      export ICON_FILE=󰉋 # ranger, finder
      export ICON_GIT=󰊢 # lazygit
      export ICON_LIST=󱃔 # taskwarrior, taskwarrior-tui, reminders, onenote
      export ICON_SCREENSAVOR=󱄄 # unimatrix, pipe.sh

      export ICON_WEATHER=󰖕 # weather
      export ICON_MAIL=󰇮 # mail, outlook
      export ICON_CALC=󰪚 # calculator, numi
      export ICON_MAP=󰆋 # maps, find my
      export ICON_MICROPHONE=󰍬 # voice memos
      export ICON_CHAT=󰍩 # messages, slack, teams, discord, telegram
      export ICON_VIDEOCHAT=󰍫 # facetime, zoom, webex
      export ICON_NOTE=󱞎 # notes, textedit, stickies, word, bat
      export ICON_CAMERA=󰄀 # photo booth
      export ICON_WEB=󰇧 # safari, beam, duckduckgo, arc, edge, chrome, firefox
      export ICON_HOMEAUTOMATION=󱉑 # home
      export ICON_MUSIC=󰎄 # music, spotify
      export ICON_PODCAST=󰦔 # podcasts
      export ICON_PLAY=󱉺 # tv, quicktime, vlc
      export ICON_BOOK=󰂿 # books
      export ICON_BOOKINFO=󱁯 # font book, dictionary
      export ICON_PREVIEW=󰋲 # screenshot, preview
      export ICON_PASSKEY=󰷡 # 1password
      export ICON_DOWNLOAD=󱑢 # progressive downloader, transmission
      export ICON_CAST=󱒃 # airflow
      export ICON_TABLE=󰓫 # excel
      export ICON_PRESENT=󰈩 # powerpoint
      export ICON_CLOUD=󰅧 # onedrive
      export ICON_PEN=󰏬 # curve
      export ICON_REMOTEDESKTOP=󰢹 # remote desktop, vmware, utm

      export ICON_CLOCK=󰥔 # clock, timewarrior, tty-clock
      export ICON_CALENDAR=󰃭 # calendar

      export ICON_WIFI=󰖩
      export ICON_WIFI_OFF=󰖪
      export ICON_VPN=󰦝 # vpn, nordvpn

      export ICONS_VOLUME=(󰸈 󰕿 󰖀 󰕾)

      export ICONS_BATTERY=(󰂎 󰁺 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂁 󰂂 󰁹)
      export ICONS_BATTERY_CHARGING=(󰢟 󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)

      export ICON_SWAP=󰁯
      export ICON_RAM=󰓅
      export ICON_DISK=󰋊 # disk utility
      export ICON_CPU=󰘚
    '';
  };
}
