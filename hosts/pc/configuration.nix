{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/default.nix
    ./../../modules/nixos/sway/default.nix
    ./../../modules/nixos/steam.nix
  ];

  callum.autologin.enable = true;
  networking.hostName = "pc";
  home-manager.users."callum" = import ./home.nix;
}
