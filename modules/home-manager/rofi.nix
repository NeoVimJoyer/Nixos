{ config, ... }:

let
  light = import ./../colors/light.nix;
in
{
  programs.rofi = {
    enable = true;
    location = "top-left";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in{
      "*" = {
        background-color = if config.theme.light.enable then mkLiteral "${light.white}" else mkLiteral "#000000";
        text-color = if config.theme.light.enable then mkLiteral "${light.black}" else mkLiteral "#7dfdfe";
        width = 512;
      };

      "#inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "#textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = mkLiteral "5px";
        text-color = mkLiteral "@text-color";
      };
    };
  };
}
