{ lib, config, ... }:

{
  config = lib.mkIf config.defaultPkgs.enable {
    # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = {
      enable = true;
      theme = "github_dark";
      settings = {
        window.opacity = 0.9;
        font.normal = {
          #family = "Jetbrains Mono Nerd Font";
          family = "Maple Mono";
          style = "Regular";
        };
      };
    };
  };
}
