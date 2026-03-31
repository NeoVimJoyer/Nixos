{ pkgs, ... }:

let
  colors = import ./../../../colors/tron.nix;
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
      inside-color = "${colors.blue}";
      inside-clear-color = "${colors.yellow}";
      inside-ver-color = "${colors.green}";
      inside-wrong-color = "${colors.red}";
      key-hl-color = "${colors.cyan}";
      layout-text-color = "${colors.white}";
      ring-color = "${colors.blue}";
      ring-clear-color = "${colors.yellow}";
      ring-ver-color = "${colors.green}";
      ring-wrong-color = "${colors.red}";
      text-color = "${colors.white}";
    };
  };
}
