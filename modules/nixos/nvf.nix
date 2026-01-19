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
    environment.systemPackages = if config.theme.light.enable then inputs.nvf_light.packages.${pkgs.system}.default else inputs.nvf_tron.packages.${pkgs.system}.default;
  };
}
