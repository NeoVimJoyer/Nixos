{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    imagemagick
  ];
  security.pam.services.swaylock = { };
}
