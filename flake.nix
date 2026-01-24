{
  description = "A very basic flake";
  inputs = {
    nixpkgs-streamcontroller.url = "github:NixOS/nixpkgs/pull/416567/head";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    agenix.url = "github:ryantm/agenix";

    alien = {
      url = "github:thiagokokada/nix-alien";
    };
    agenix-rekey = {
      url = "github:oddlama/agenix-rekey";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    dolphin-overlay = {
      url = "github:rumboon/dolphin-overlay";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hytale = {
      url = "github:swagtop/hytale-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    secrets = {
      url = "git+ssh://git@github.com/Axioms/nixos-secrets.git";
      flake = false;
    };
    mineral = {
      url = "github:cynicsketch/nix-mineral/";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixvirt = {
      url = "https://flakehub.com/f/AshleyYakeley/NixVirt/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs = {
        home-manager.follows = "home-manager-stable";
        nixpkgs.follows = "nixpkgs-stable";
      };
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
      inputs.home-manager.follows = "home-manager-stable";
    };
    ucodenix.url = "github:e-tho/ucodenix";
  };

  outputs =
    {
      self,
      agenix,
      agenix-rekey,
      lanzaboote,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      helpers = import ./flakeHelpers.nix inputs;
      inherit (helpers) mkMerge;
    in
    {
      formatter.x86_64-linux = inputs.nixpkgs-stable.legacyPackages.x86_64-linux.nixfmt-tree;

      nixosConfigurations = {
        vm = inputs.nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs outputs self;
          };
          modules = [
            ./machines/Vm
            ./modules/core/age/age.nix
            lanzaboote.nixosModules.lanzaboote
            agenix.nixosModules.default
            agenix-rekey.nixosModules.default
            inputs.home-manager-stable.nixosModules.home-manager
          ];
        };

        Virgo = inputs.nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs outputs self;
          };
          modules = [
            ./machines/Virgo
            ./modules/core/age/age.nix
            lanzaboote.nixosModules.lanzaboote
            agenix.nixosModules.default
            agenix-rekey.nixosModules.default
            inputs.home-manager-stable.nixosModules.home-manager
            { nixpkgs.overlays = [ inputs.dolphin-overlay.overlays.default ]; }
          ];
        };

        Aries = inputs.nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs outputs self;
          };
          modules = [
            ./machines/Aries
            ./modules/core/age/age.nix
            lanzaboote.nixosModules.lanzaboote
            agenix.nixosModules.default
            agenix-rekey.nixosModules.default
            inputs.home-manager-stable.nixosModules.home-manager
            { nixpkgs.overlays = [ inputs.dolphin-overlay.overlays.default ]; }
          ];
        };
      };
      agenix-rekey = inputs.agenix-rekey.configure {
        userFlake = self;
        inherit (self) nixosConfigurations;
        agePackage = p: p.age;
      };
    }
    // inputs.flake-utils.lib.eachDefaultSystem (system: rec {
      # Create a pkgs with the agenix-rekey overlay so we have access to `pkgs.agenix-rekey` later
      pkgs = import inputs.nixpkgs-unstable {
        inherit system;
        overlays = [ inputs.agenix-rekey.overlays.default ];
      };

      # Add agenix-rekey to your devshell, so you can use the `agenix rekey` command
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.agenix-rekey
          pkgs.age-plugin-yubikey
          pkgs.just
        ];
        # ...
      };
    });
}
