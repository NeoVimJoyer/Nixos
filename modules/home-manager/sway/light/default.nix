{ ... }:

let
  colors = import ./../../../colors/light.nix;
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
        { command = "awww img ~/config/wallpapers/light.png"; }
      ];

      keybindings = {
        "Mod4+Shift+i" = "workspace number 1; exec waybar; exec awww img --transition-step 255 ~/config/wallpapers/light.jpg; exec pkill mpg123";
      };

      window.titlebar = false; 
      gaps = {
        outer = 5;
        inner = 15;
      };
      colors = {
        unfocused = { 
          background = "${colors.white}";
          border = "${colors.black}";
          childBorder = "${colors.black}";
          indicator = "${colors.black}";
          text = "${colors.black}";
        };
        focused = { 
          background = "${colors.white}";
          border = "${colors.black}";
          childBorder = "${colors.black}";
          indicator = "${colors.black}";
          text = "${colors.black}";
        };
      };

      # Disable swaybar
      bars = [ ];
    };
  };
}
