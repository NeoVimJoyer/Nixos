{ lib, config, ... }:

let
  light = import ./../colors/light.nix;
in
{
  options.theme.light.enable = lib.mkEnableOption "enables light theme, tron is default" // { default = false; };

  config = lib.mkIf config.defaultPkgs.enable {
    # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = {
      enable = true;
      settings = {
        window.opacity = if config.theme.light.enable then 1 else 0.4;
        font.normal = {
          family = "Maple Mono";
          style = "Regular";
        };
        colors = if config.theme.light.enable then {
          primary ={
            foreground = "${light.black}";
            background = "${light.white}";
          };
          normal = {
            black = "${light.black}";
            red = "${light.red}";
            green = "${light.green}";
            yellow = "${light.brown}";
            blue = "${light.blue}";
            magenta = "${light.purple}";
            cyan = "${light.cyan}";
            white = "${light.white}";
          };
        } else {
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
