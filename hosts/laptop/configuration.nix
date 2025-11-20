{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/default.nix
    ./../../modules/nixos/sway/default.nix
  ];

  environment.systemPackages = with pkgs; [
    teams-for-linux
  ];

  networking.hostName = "laptop";
  home-manager.users."callum" = import ./home.nix;
}
