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
        { command = "swww img ~/config/wallpapers/light.png"; }
      ];

      window.titlebar = false;
      colors = {
        unfocused = {
          background = "#ffffff";
          border = "#ffffff";
          childBorder = "#ffffff";
          indicator = "#ffffff";
          text = "#000000";
        };
        focused = {
          background = "#ffffff";
          border = "#ffffff";
          childBorder = "#ffffff";
          indicator = "#ffffff";
          text = "#000000";
        };
      };

      # Disable swaybar
      bars = [ ];
    };
  };
}
