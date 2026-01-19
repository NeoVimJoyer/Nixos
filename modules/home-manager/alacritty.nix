{ lib, config, ... }:

{
  options.theme.light.enable = lib.mkEnableOption "enables light theme, tron is default" // { default = false; };

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
        colors = if config.theme.light.enable then {
          primary ={
            foreground = "#1f2335";
            background = "#c0caf5";
          };
          normal = {
            black = "#1f2335";
            red = "#f7768e";
            green = "#9ece6a";
            yellow = "#e0af68";
            blue = "#7aa2f7";
            magenta = "#9d7cd8";
            cyan = "#7dcfff";
            white = "#c0caf5";
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
