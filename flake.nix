{
  # Based on https://github.com/ryan4yin/nix-darwin-kickstarter
  description = "My Darwin Flake Configuration";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];

    substituters = [
      "https://cache.nixos.org"
    ];
  };

  inputs =
    {
      # Default Stable Nix Packages
      nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

      # Unstable Nix Packages
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

      nix-homebrew = {
        url = "github:zhaofengli-wip/nix-homebrew";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };

      homebrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
      };
      homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
      };
      homebrew-bundle = {
        url = "github:homebrew/homebrew-bundle";
        flake = false;
      };

      # home-manager, used for managing user configuration
      home-manager = {
        url = "github:nix-community/home-manager/release-24.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      # MacOS Package Management
      darwin = {
        url = "github:lnl7/nix-darwin/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      # Emacs Overlays
      emacs-overlay = {
        url = "github:nix-community/emacs-overlay";
        flake = false;
      };

       # Nix-community Doom Emacs
      doom-emacs = {
        url = "github:nix-community/nix-doom-emacs";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.emacs-overlay.follows = "emacs-overlay";
      };

    };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, darwin, doom-emacs, nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, ... }:   # Function that tells my flake which to use and what do what to do with the dependencies.
    # Variables that can be used in the config files.
    let
      location = "$HOME/.setup";
      system = "aarch64-darwin";

      makeConfig = username: hostname: device_type: darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit username hostname device_type; };
        modules = [
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix
          ./modules/host-users.nix
          ./modules/desktop

          #  Manage a user environment using Nix.
          #  NOTE: Your can find all available options in:
          #  https://nix-community.github.io/home-manager/nix-darwin-options.html
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs username hostname device_type;
            };
            home-manager.users.${username} = import ./home;
          }

          # Module to install Homebrew package manager.
          # https://github.com/zhaofengli/nix-homebrew
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = false;

              # User owning the Homebrew prefix
              user = username;

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;

              # taps = {
              #   "homebrew/homebrew-core" = homebrew-core;
              #   "homebrew/homebrew-cask" = homebrew-cask;
              #   "homebrew/homebrew-bundle" = homebrew-bundle;
              # };
              # mutableTaps = false;
            };
          }
        ];
      };      
    in
    {

      darwinConfigurations = {
        "dm-laptop" = makeConfig "dm" "dmiroshnichenko-laptop" "laptop";
        "dm-mac" = makeConfig "dm" "dmiroshnichenko-mac" "desktop";
      };
      
      # nix codee formmater
      formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    };
}