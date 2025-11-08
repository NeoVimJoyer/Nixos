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
<<<<<<< HEAD
      pkgs.neofetch
=======
      pkgs.fastfetch
>>>>>>> 8827c46 (laptop stuff)
      pkgs.git
      pkgs.feh
      pkgs.tor-browser
    ];
  };
}
