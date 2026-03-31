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

  # Wallpaper app
  services.swww.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      # Launch waybar on startup
      startup = [
        { command = "waybar"; }
        { command = "swww img ~/config/wallpapers/tron.jpg"; }
      ];

      window.titlebar = false; 
      gaps = {
        outer = 15;
        inner = 25;
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
