{ ... }:

let
  colors = import ./../../../colors/jid.nix;
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
        { command = "swww img ~/config/wallpapers/jid.jpg"; }
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
          text = "${colors.yellow}";
        };
        focused = {
          background = "${colors.black}";
          border = "${colors.black}";
          childBorder = "${colors.black}";
          indicator = "${colors.black}";
          text = "${colors.yellow}";
        };
      };

      # Disable swaybar
      bars = [ ];
    };
  };
}
