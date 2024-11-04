{ config
, lib
, pkgs
, ... }: {
  programs.zsh = {                                       # Post installation script is run in configuration.nix to make it default shell
    enable = true;
    autosuggestion.enable = true;               # Auto suggest options and highlights syntax. It searches in history for options
    syntaxHighlighting.enable = true;
    history.size = 10000;

    oh-my-zsh = {                               # Extra plugins for zsh
      enable = true;
      plugins = [ "git" ];
      custom = "$HOME/.config/zsh_nix/custom";
    };

    sessionVariables.SSH_AUTH_SOCK = "~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";

    initExtra = ''
      # Spaceship
      # eval "$(/opt/homebrew/bin/brew shellenv)"
      source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
      autoload -U promptinit; promptinit
      pfetch
      export GOROOT=$(go env GOROOT)
      export GOPATH=$(go env GOPATH)
      export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
      # go env -w GOSUMDB=sum.golang.org
      # go env -w GOPROXY=https://proxy.golang.org,direct
      export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
      alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
    '';                                         # Zsh theme
  };
}
