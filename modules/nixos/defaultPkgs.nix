{
  config,
  lib,
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
    environment.systemPackages = with pkgs; [
      tree 
      fastfetch
      git
      feh
      tor-browser
      kdePackages.dolphin
      zip
      unzip
      sl
      mpg123
    ];
  };
}
