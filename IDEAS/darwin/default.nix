{ lib, inputs, nixpkgs, home-manager, darwin, user, nix-homebrew, homebrew-core, homebrew-cask, ...}:

let
  system = "aarch64-darwin";                                 # System architecture
in
{
  dm-laptop = darwin.lib.darwinSystem {                       # MacBook8,1 "Core M" 1.2 12" (2015) A1534 ECM2746 profile
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [                                             # Modules that are used
      # ./configuration.nix
      
      home-manager.darwinModules.home-manager {             # Home-Manager module that is used
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };  # Pass flake variable
        home-manager.users.${user} = import ./home.nix;
      }

      nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          # Install Homebrew under the default prefix
          enable = true;

          # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
          enableRosetta = true;

          # User owning the Homebrew prefix
          user = "fishhead";

          # Automatically migrate existing Homebrew installations
          autoMigrate = true;
        };
      }
    ];
  };
}