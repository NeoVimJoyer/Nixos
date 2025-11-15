{ lib, config, ... }:

{
  config = lib.mkIf config.defaultPkgs.enable {
    # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.4;
        font.normal = {
          family = "Maple Mono";
          style = "Regular";
        };
        colors = {
          primary ={
            foreground = "#7dfdfe";
            background = "#000000";
          };
          normal = {
            black = "#000000";
            red = "#f91e0b";
            green = "#00ef10";
            yellow = "#f6e035";
            blue = "#7dfdfe";
            magenta = "#6507f5";
            cyan = "#2f8ca3";
            white = "#FFFFFF";
          };
        };
      };
    };
  };
}
