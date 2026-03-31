{ config, ... }:

let
  light = import ./../colors/light.nix;
  tron = import ./../colors/tron.nix;
  jid = import ./../colors/jid.nix;
in
{
  programs.rofi = {
    enable = true;
    location = "top-left";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in{
      "*" = {
        background-color = if config.theme.light.enable then mkLiteral "${light.white}" else if config.theme.jid.enable then mkLiteral "${jid.black}" else mkLiteral "${tron.black}";
        text-color = if config.theme.light.enable then mkLiteral "${light.black}" else if config.theme.jid.enable then mkLiteral "${jid.yellow}" else mkLiteral "${tron.blue}";
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
