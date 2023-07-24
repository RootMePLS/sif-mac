{ config, pkgs, username, ... }:

{
  launchd.user.agents.sketchybar = {
    serviceConfig = {
      StandardOutPath = "/tmp/sketchybar.log";
      StandardErrorPath = "/tmp/sketchybar.log";

      ProgramArguments =
        [ "${cfg.package}/bin/sketchybar" ];
      # ++ optionals (cfg.config != "") ["--config" configFile];
      KeepAlive = true;
      RunAtLoad = true;
      # only to pass gh and jq
      EnvironmentVariables = {
        PATH = "${cfg.package}/bin:${config.environment.systemPath}:${homeDir}/.nix-profile/bin";
      };
    };
  };
}
