{ pkgs, ... }:

{
  imports = [
    ./swaylock.nix
    ./tuigreet.nix
  ];

  environment.systemPackages = with pkgs; [
    grim
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
