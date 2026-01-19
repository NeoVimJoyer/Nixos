{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/default.nix
    ./../../modules/nixos/sway/light/default.nix
    ./../../modules/nixos/ai.nix
  ];

  environment.systemPackages = with pkgs; [
    teams-for-linux
  ];

  networking.hostName = "laptop";
  home-manager.users."callum" = import ./home.nix;
}
