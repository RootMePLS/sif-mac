{ pkgs, ...}: {

  ##########################################################################
  # 
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  # 
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    neovim
    git
    ansible
    emacs
    fd
    ripgrep
    pfetch
    alacritty
    tmux
  ];

  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };

  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas 
    masApps = {
      "1password" = 1333542190;
      "Tailscale" = 1475387142;
      "Slack" = 803453959;
      "Telegram" = 747648890;
      "Yubico Authenticator" = 1497506650;
      # Xcode = 497799835;
    };

    taps = [
      # default
      "homebrew/core"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"

      # custom
      # "cmacrae/formulae" # spacebar
      "koekeishiya/formulae" # yabai
      "FelixKratz/formulae" # sketchybar
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "wget"  # download tool
      "curl"  # no not install curl via nixpkgs, it's not working well on macOS!
      "httpie"  # http client
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "firefox"
      "google-chrome"
      
      # IM & audio & remote desktop & meeting
      "discord"
      "microsoft-teams"
      "zoom"

      "anki"
      "clashx"    # proxy tool
      "openinterminal-lite"  # open current folder in terminal
      "raycast"   # (HotKey: alt/option + space)search, caculate and run scripts(with many plugins)
      "iglance"   # beautiful system monitor
      "obs" # stream / recoding software

      # Development
      "insomnia"  # REST client
      "wireshark"  # network analyzer
      "postman"
      "visual-studio-code"

      "sf-symbols" # patched font for sketchybar
      "font-hack-nerd-font"
      "browserosaurus" # choose browser on each link
      "shottr" # screenshot tool
      "vlc" # media player
      "utterly" # background noise cancellation
      "keycastr" # show keystrokes on screen
      "spotify"
      "obsidian"
    ];
  };
}
