{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
    nvf.url = "github:notashelf/nvf";
    nix-colors.url = "github:misterio77/nix-colors";

    groundhog.url = "github:B3ella/groundhog";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, groundhog, home-manager, nvf, nix-colors, ... }@inputs:
  let
    system = "x86_64-linux";
    username = "bella";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit system;
        inherit groundhog;
      };

      modules = [
        groundhog.nixosModules.default

        ./hosts/nixos

        {
          services.groundhog = {
            enable = true;
            user = bella;
          };
        }

        home-manager.nixosModules.home-manager

        {
          nixpkgs.config.allowUnfree = true;

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit
                inputs
                system
                username
                nix-colors
                nvf;
            };

            sharedModules = [
              nvf.homeManagerModules.default
            ];

            users.${username} = import ./home/${username};
          };
        }
      ];
    };
  };
}