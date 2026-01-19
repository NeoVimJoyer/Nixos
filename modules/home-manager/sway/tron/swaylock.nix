{ pkgs, ... }:

let
  # Tron colorscheme
  white = "FFFFFF";
  red = "f91e0b";
  yellow = "f6e035";
  blue = "7dfdfe";
  cyan = "2f8ca3";
  green = "00ef10";
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
      bs-hl-color = red;
      indicator-idle-visible = true;
      indicator-radius = 100;
      indicator-thickness = 15;
      inside-color = blue;
      inside-clear-color = yellow;
      inside-ver-color = green;
      inside-wrong-color = red;
      key-hl-color = cyan;
      layout-text-color = white;
      ring-color = blue;
      ring-clear-color = yellow;
      ring-ver-color = green;
      ring-wrong-color = red;
      text-color = white;
    };
  };
}
