{ username, lib, ... }:

{
  ##########################################################################
  # 
  #  Import sub modules
  #
  #  NOTE: Your can find all available options for "programs." in:
  #    https://rycee.gitlab.io/home-manager/options.html
  # 
  #
  ##########################################################################
  imports = [
    # ./sketchybar
    ./aerospace
    ./bash.nix
    ./core.nix
    ./git.nix
    ./neovim.nix
    ./ssh.nix
    ./starship.nix
    ./zsh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";


    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activation.activateSettings = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Running activateSettings -u to apply macOS preferences immediately"
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
