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

  # Wallpaper app
  services.swww.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      # Launch waybar on startup
      startup = [
        { command = "waybar"; }
        { command = "swww img ~/config/wallpapers/light.png"; }
      ];

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
