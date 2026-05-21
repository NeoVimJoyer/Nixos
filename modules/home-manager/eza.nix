{ lib, config, ... }:

{
  config = lib.mkIf config.defaultPkgs.enable {
    # Defined in defaultPkgs.nix
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "always";
      git = true;
    };
  };
}
