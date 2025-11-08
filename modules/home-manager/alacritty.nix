{ lib, config, ... }:

{
  config = lib.mkIf config.defaultPkgs.enable {
    # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = {
      enable = true;
<<<<<<< HEAD
      theme = "nord";
=======
      theme = "github_dark";
>>>>>>> 8827c46 (laptop stuff)
      settings = {
        window.opacity = 0.9;
        font.normal = {
          family = "Jetbrains Mono Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
