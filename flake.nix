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
        # Laptop configs
        light = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop/light/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        tron = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop/tron/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

        jid = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop/jid/configuration.nix
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
