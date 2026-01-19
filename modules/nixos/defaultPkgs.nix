{
  config,
  lib,
  inputs,
  pkgs, 
  ...
}:

{
  options.defaultPkgs = {
    enable = lib.mkEnableOption "enables defaultPkgs" // {
      default = true;
    };
  };

  config = lib.mkIf config.defaultPkgs.enable {
    environment.systemPackages = [
      pkgs.tree 
      pkgs.fastfetch
      pkgs.git
      pkgs.feh
      pkgs.tor-browser
      pkgs.kdePackages.dolphin
      pkgs.zip
      pkgs.unzip
      pkgs.sl
    ];
  };
}
