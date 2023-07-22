{
  description = "My Darwin Flake Configuration";

  inputs =                                                                  # All flake references used to build my NixOS setup. These are dependencies.
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";                     # Default Stable Nix Packages
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";         # Unstable Nix Packages

      nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

      # Optional: Declarative tap management
      homebrew-core = {
        url = "github:homebrew/homebrew-core";
        flake = false;
      };
      homebrew-cask = {
        url = "github:homebrew/homebrew-cask";
        flake = false;
      };

      home-manager = {                                                      # User Package Management
        url = "github:nix-community/home-manager/release-23.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      darwin = {
        url = "github:lnl7/nix-darwin/master";                              # MacOS Package Management
        inputs.nixpkgs.follows = "nixpkgs";
      };

      emacs-overlay = {                                                     # Emacs Overlays
        url = "github:nix-community/emacs-overlay";
        flake = false;
      };

      doom-emacs = {                                                        # Nix-community Doom Emacs
        url = "github:nix-community/nix-doom-emacs";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.emacs-overlay.follows = "emacs-overlay";
      };

    };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, darwin, doom-emacs, nix-homebrew, homebrew-core, homebrew-cask, ... }:   # Function that tells my flake which to use and what do what to do with the dependencies.
    let                                                                     # Variables that can be used in the config files.
      user = "fishhead";
      location = "$HOME/.setup";
    in                                                                      # Use above variables in ...
    {
      darwinConfigurations = (                                              # Darwin Configurations
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-unstable home-manager darwin user nix-homebrew homebrew-core homebrew-cask;
        }
      );

      # homeConfigurations = (                                                # Non-NixOS configurations
      #   import ./nix {
      #     inherit (nixpkgs) lib;
      #     inherit inputs nixpkgs nixpkgs-unstable home-manager nixgl user;
      #   }
      # );
    };
}