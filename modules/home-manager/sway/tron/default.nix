{ ... }:

let
  colors = import ./../../../colors/tron.nix;
in
{
  imports = [
    ../default.nix
    ./swaylock.nix
    ./waybar.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      # Launch waybar on startup
      startup = [
        { command = "waybar"; }
        { command = "awww img ~/config/wallpapers/tron.jpg"; }
      ];

      window.titlebar = false; 
      gaps = {
        outer = 5;
        inner = 15;
      };
      colors = {
        unfocused = {
          background = "${colors.black}";
          border = "${colors.black}";
          childBorder = "${colors.black}";
          indicator = "${colors.black}";
          text = "${colors.white}";
        };
        focused = {
          background = "${colors.black}";
          border = "${colors.black}";
          childBorder = "${colors.black}";
          indicator = "${colors.black}";
          text = "${colors.white}";
        };
      };

      # Disable swaybar
      bars = [ ];
    };
  };
}
