{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    nvf_tron = {
      url = "path:./nvf/tron/";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
    nvf_light = {
      url = "path:./nvf/light/";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    nvf_jid = {
      url = "path:./nvf/jid/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-mineral = {
      url = "github:cynicsketch/nix-mineral";
      flake = false;
    };
    nix-ai-tools.url = "github:numtide/nix-ai-tools";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        # Surface configs
        surface_tron = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/surface/tron/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        # Mac configs
        mac_light = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/mac/light/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        mac_tron = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/mac/tron/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        mac_jid = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/mac/jid/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        # PC configs
        pc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/pc/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
