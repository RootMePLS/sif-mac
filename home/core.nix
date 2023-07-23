{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    caddy
    gnupg

    # productivity
    glow # markdown previewer in terminal
  ];

  programs = {
    zsh = {                                       # Post installation script is run in configuration.nix to make it default shell
      enable = true;
      enableAutosuggestions = true;               # Auto suggest options and highlights syntax. It searches in history for options
      enableSyntaxHighlighting = true;
      history.size = 10000;

      oh-my-zsh = {                               # Extra plugins for zsh
        enable = true;
        plugins = [ "git" ];
        custom = "$HOME/.config/zsh_nix/custom";
      };

      initExtra = ''
        # Spaceship
        # eval "$(/opt/homebrew/bin/brew shellenv)"
        source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
        autoload -U promptinit; promptinit
        pfetch
      '';                                         # Zsh theme
    };

    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [

        # Syntax
        vim-nix
        vim-markdown

        # Quality of life
        vim-lastplace                             # Opens document where you left it
        auto-pairs                                # Print double quotes/brackets/etc.
        vim-gitgutter                             # See uncommitted changes of file :GitGutterEnable

        # File Tree
        nerdtree                                  # File Manager - set in extraConfig to F6

        # Customization 
        lightline-vim                             # Info bar at bottom
        indent-blankline-nvim                     # Indentation lines
      ];

      extraConfig = ''
          syntax enable                             " Syntax highlighting

          highlight Comment cterm=italic gui=italic " Comments become italic
          hi Normal guibg=NONE ctermbg=NONE         " Remove background, better for personal theme
          
          set number                                " Set numbers

          nmap <F6> :NERDTreeToggle<CR>             " F6 opens NERDTree
      '';
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    exa = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    # skim provides a single executable: sk.
    # Basically anywhere you would want to use grep, try sk instead.
    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
