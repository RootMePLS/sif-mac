{ config, pkgs, username, ... }:

## Sketchybar daemon
## Configuration files ../../home/home/sketchybar
{
  launchd.user.agents.sketchybar = {
    # path = [ pkgs.sketchybar ] ++ [ pkgs.sketchybar-app-font ] ++ [ config.environment.systemPath ];
    serviceConfig = {
      StandardOutPath = "/tmp/sketchybar.log";
      StandardErrorPath = "/tmp/sketchybar.log";

      ProgramArguments = [ "${pkgs.sketchybar}/bin/sketchybar" ] ++ ["--config" "/Users/${username}/.config/sketchybar/sketchybarrc"];
      KeepAlive = true;
      RunAtLoad = true;
      EnvironmentVariables = {
        PATH = "${pkgs.sketchybar}/bin:${config.environment.systemPath}:/Users/${username}/.nix-profile/bin";
      };
    };
  };
}
