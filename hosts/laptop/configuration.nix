{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/default.nix
    ./../../modules/nixos/sway/default.nix
    ./../../modules/nixos/nvf/nvf_light.nix
    ./../../modules/nixos/ai.nix
  ];

  theme.light.enable = true;

  environment.systemPackages = with pkgs; [
    teams-for-linux
  ];

  networking.hostName = "laptop";
  home-manager.users."callum" = import ./home.nix;
}
