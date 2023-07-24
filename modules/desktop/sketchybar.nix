{ config, pkgs, username, ... }:

{
  launchd.user.agents.sketchybar = {
    serviceConfig = {
      StandardOutPath = "/tmp/sketchybar.log";
      StandardErrorPath = "/tmp/sketchybar.log";

      ProgramArguments = [ "${pkgs.sketchybar}/bin/sketchybar" ];
      KeepAlive = true;
      RunAtLoad = true;
      EnvironmentVariables = {
        PATH = "${pkgs.sketchybar}/bin:${config.environment.systemPath}:/Users/${username}/.nix-profile/bin";
      };
    };
  };
}
