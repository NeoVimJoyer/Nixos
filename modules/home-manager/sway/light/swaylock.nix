{ pkgs, ... }:

let
  colors = import ./../../../colors/light.nix;
in
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      screenshots = true;
      effect-blur = "5x5";
      fade-in = .3;

      disable-caps-lock-text = true;
      bs-hl-color = "${colors.red}";
      indicator-idle-visible = true;
      indicator-radius = 100;
      indicator-thickness = 15;
      inside-color = "${colors.white}";
      inside-clear-color = "${colors.brown}";
      inside-ver-color = "${colors.green}";
      inside-wrong-color = "${colors.red}";
      key-hl-color = "${colors.blue}";
      layout-text-color = "${colors.black}";
      ring-color = "${colors.white}";
      ring-clear-color = "${colors.brown}";
      ring-ver-color = "${colors.green}";
      ring-wrong-color = "${colors.red}";
      text-color = "${colors.black}";
    };
  };
}
