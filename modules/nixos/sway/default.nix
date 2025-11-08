{ ... }:

{
  imports = [
    ./swaylock.nix
    ./tuigreet.nix
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
