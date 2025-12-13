{ config, ... }:

{
  programs.rofi = {
    enable = true;
    location = "top-left";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in{
      "*" = {
        background-color = mkLiteral "#000000";
        text-color = mkLiteral "#7dfdfe";
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
