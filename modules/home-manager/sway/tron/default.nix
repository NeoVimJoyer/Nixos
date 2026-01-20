{ ... }:

{
  imports = [
    ../default.nix
    ./swaylock.nix
    ./waybar/default.nix
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
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#ffffff";
        };
        focused = {
          background = "#000000";
          border = "#000000";
          childBorder = "#000000";
          indicator = "#000000";
          text = "#ffffff";
        };
      };

      # Disable swaybar
      bars = [ ];
    };
  };
}
