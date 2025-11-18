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
      inputs.nvf.packages.${pkgs.system}.default
      pkgs.tree 
      pkgs.fastfetch
      pkgs.git
      pkgs.feh
      pkgs.tor-browser
      pkgs.kdePackages.dolphin
      pkgs.grim
    ];
  };
}
