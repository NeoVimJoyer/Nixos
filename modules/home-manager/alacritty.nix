{ lib, config, ... }:

let
  light = import ./../colors/light.nix;
  tron = import ./../colors/tron.nix;
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
            foreground = "${tron.blue}";
            background = "${tron.black}";
          };
          normal = {
            black = "${tron.black}";
            red = "${tron.red}";
            green = "${tron.green}";
            yellow = "${tron.yellow}";
            blue = "${tron.blue}";
            magenta = "${tron.purple}";
            cyan = "${tron.cyan}";
            white = "${tron.white}";
          };
        };
      };
    };
  };
}
