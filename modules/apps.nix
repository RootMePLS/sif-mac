{ pkgs, ...}: {

  ##########################################################################
  # 
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  # 
  # TODO Fell free to modify this file to fit your needs.
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
  ];

  # Environment variables
  environment.variables = {
    EDITOR = "nvim";
  };

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  # 
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
      # TODO Feel free to add your favorite apps here.

      Xcode = 497799835;
    };

    taps = [
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
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
      "visual-studio-code"

      # IM & audio & remote desktop & meeting
      "telegram"
      "discord"

      "anki"
      "clashx"    # proxy tool
      "iina"      # video player
      "openinterminal-lite"  # open current folder in terminal
      "raycast"   # (HotKey: alt/option + space)search, caculate and run scripts(with many plugins)
      "iglance"   # beautiful system monitor

      # Development
      "insomnia"  # REST client
      "wireshark"  # network analyzer
    ];
  };
}
