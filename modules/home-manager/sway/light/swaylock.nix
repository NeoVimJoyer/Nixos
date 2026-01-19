{ pkgs, ... }:

let
  white = "c0caf5";
  black = "1f2335";
  red = "f7768e";
  yellow = "e0af68";
  blue = "7aa2f7";
  cyan = "7dcfff";
  green = "9ece6a";
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
      key-hl-color = white;
      layout-text-color = black;
      ring-color = blue;
      ring-clear-color = yellow;
      ring-ver-color = green;
      ring-wrong-color = red;
      text-color = black;
    };
  };
}
