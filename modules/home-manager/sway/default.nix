{ pkgs, lib, ... }:

let
  mod = "Mod4";
  terminal = "alacritty";
  menu = "rofi -show drun";
  fileexplorer = "dolphin";
  browser = "floorp";
  browsersecure = "tor-browser";
  screenshot = "grim ~/Downloads/screenshot_$(date +'%Y-m%-%d_%H-%M-%S').png";
  lock = pkgs.writeShellScriptBin "lock" ''
    grim ~/config/wallpapers/screenshot.jpg
    magick ~/config/wallpapers/screenshot.jpg -blur 0x4 ~/config/wallpapers/blurred.jpg
    swaylock
    rm ~/config/wallpapers/screenshot.jpg
    rm ~/config/wallpapers/blurred.jpg
  '';
in
{
  imports = [
    ./waybar/default.nix
    ./swaylock.nix
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

      keybindings = {
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+Left" = "resize shrink width 10px";
        "${mod}+Right" = "resize grow width 10px";
        "${mod}+Down" = "resize shrink height 10px";
        "${mod}+Up" = "resize grow height 10px";

        "${mod}+Space" = "exec ${menu}";
        "${mod}+z" = "exec ${lib.getExe lock}";
        "${mod}+e" = "kill";
        "${mod}+Return" = "exec ${terminal}";
        "${mod}+Shift+f" = "exec ${fileexplorer}";
        "${mod}+n" = "exec nvim";
        "${mod}+c" = "exec cheese";

        "${mod}+a+p" = "exec pactl set-sink-volume \@DEFAULT_SINK@ +5%";
        "${mod}+a+d" = "exec pactl set-sink-volume \@DEFAULT_SINK@ -5%";

        "${mod}+b" = "exec ${browser}";
        "${mod}+Shift+b" = "exec ${browsersecure}";

        "${mod}+g+s" = "exec steam";
        "${mod}+g+d" = "exec discord";

        "${mod}+m" = "exec teams-for-linux";

        "${mod}+u+t" = "exec ${screenshot}";
        "${mod}+u+f" = "fullscreen";
        "${mod}+u+r" = "exec reboot";
        "${mod}+u+p" = "exec shutdown now";
        "${mod}+u+k+p" = "exec brightnessctl set 5%+";
        "${mod}+u+k+d" = "exec brightnessctl set 5%-";
      };
    };
  };
}
