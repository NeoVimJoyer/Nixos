{
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # Enable home manager for main user
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    #useGlobalPkgs = true;
    #useUserPkgs = true;
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
  };
}
