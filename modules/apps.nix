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
    # Development Tools
    go                      # Go programming language
    git                     # Version control system
    emacs                   # Text editor
    neovim                  # Advanced Vim text editor
    tmux                    # Terminal multiplexer

    # Command-Line Utilities
    fd                      # Simple, fast and user-friendly alternative to 'find'
    ripgrep                 # Search tool like grep but faster
    curl                    # Command-line tool for transferring data
    wget                    # Network downloader
    httpie                  # HTTP client for CLI
    jq                      # Command-line JSON processor
    pfetch                  # System information tool

    # Python & Related Packages
    python3Packages.pip     # Python package installer
    (python3.withPackages (ps: [
      ps.flask              # Python web framework
      ps.markdown           # Markdown processing library for Python
      ps.weasyprint         # PDF conversion library
    ]))

    # Cloud & Infrastructure Tools
    terraform               # Infrastructure as code tool
    terragrunt              # Wrapper for Terraform for managing configurations
    cloud-nuke              # Tool to delete cloud resources
    awscli2                  # AWS Command Line Interface
    ansible                 # Automation tool for IT operations

    # Package Managers & Project Management
    poetry                  # Python dependency management and packaging tool

    # Libraries for Graphics & System
    gobject-introspection   # Library for generating bindings for GObject-based libraries
    cairo                   # 2D graphics library
    pango                   # Text layout and rendering library
    gdk-pixbuf              # Library for image loading and manipulation
    libxml2                 # XML parsing library
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
      #"Tailscale" = 1475387142;
      "Slack" = 803453959;
      "Telegram" = 747648890;
      "Yubico Authenticator" = 1497506650;
      # Xcode = 497799835;
      "Yomu" = 562211012;
      "Omnivore" = 1564031042;
    };

    taps = [
      # default
      "homebrew/services"
      "dimentium/autoraise"
      "nikitabobko/tap"

      # custom
      # "cmacrae/formulae" # spacebar
      "FelixKratz/formulae" # sketchybar¡
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      # "wget"  # download tool
      # "curl"  # no not install curl via nixpkgs, it's not working well on macOS!
      # "httpie"  # http client
      "sketchybar"  # https://github.com/FelixKratz/SketchyBar
      #"livekit"     # Scalable, high-performance WebRTC server
      "portaudio"   # Cross-platform library for audio I/O https://www.portaudio.com
      "ffmpeg"      # Play, record, convert, and stream audio and video
      "cmake"       # Cross-platform make
      # "autoraise"   # https://github.com/Dimentium/homebrew-autoraise
      "yazi"        # Blazing fast terminal file manager written in Rust, based on async I/O
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      # Browsers
      "firefox"            # Web browser
      "google-chrome"      # Web browser
      "brave-browser"      # Web browser focused on privacy

      # Password Management
      "1password"          # Password manager
      "1password-cli"      # CLI for 1Password

      # Communication & Meeting Tools
      "discord"            # Chat and voice communication app
      # "microsoft-teams"    # Collaboration and video conferencing tool
      "zoom"               # Video conferencing tool
      "skype"              # VoIP and chat communication tool

      # Remote Desktop & Remote Work
      "nikitabobko/tap/aerospace"  # Remote desktop application
      "hiddenbar"
      "font-sf-pro"
      "sf-symbols"

      # Developer Tools & Productivity
      "warp"               # Terminal emulator for developers
      "raycast"            # Productivity tool for searching, launching apps, and running scripts
      "cursor"             # AI-based tool for code generation and editing
      "replit"             # Cloud-based code editor
      "insomnia"         # REST client (commented out)
      # "wireshark"        # Network analyzer (commented out)
      # "postman"          # API development environment (commented out)
      "visual-studio-code" # Code editor (commented out)
      #"popclip"            # Used to access context-specific actions when text is selected
      "deepl"              # Translation tool

      # Utilities
      "little-snitch"      # Network monitoring tool
      "macwhisper"         # Local transcription tool
      "flameshot"          # Screenshot tool with annotation capabilities
      # "vlc"              # Media player (commented out)
      "spotify"            # Music streaming application
      "anki"               # Flashcard app for learning
      "rescuetime"         # Time management and productivity tracking tool
      # "sf-symbols"       # Patched font for SketchyBar (commented out)
      # "font-hack-nerd-font" # Nerd font (commented out)
      # "keycastr"         # Show keystrokes on screen (commented out)

      # Notes & Organization
      "obsidian"           # Note-taking app for managing markdown files
      "orbstack"           # Docker-like container manager for macOS
      # "background-music" # Audio routing tool (commented out)
      # "macfuse"          # File system integration tool (commented out)

      # IM & Audio Tools
      "raycast"            # For hotkey search, calculation, and script running (alt/option + space)
      # "clashx"           # Proxy tool (commented out)

      # Media & Recording
      # "obs"              # Stream and recording software (commented out)
    ];
  };

}
