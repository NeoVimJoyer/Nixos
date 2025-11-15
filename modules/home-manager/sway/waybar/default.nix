{ ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      modules-left = [
        "custom/icon"
        "clock"
        "network"
        "pulseaudio"
      ];
      modules-center = [ "sway/workspaces" ];
      modules-right = [
        "temperature"
        "cpu"
        "memory"
        "disk"
        "battery"
        "custom/power"
      ];

      "custom/icon" = {
        format = "";
        tooltip = false; # Eventually add a dropdown window
      };

      "clock" = {
        "interval" = 60;
        "format" = "{:%H:%M}";
        "tooltip" = true;
        "tooltip-format" = "{:%Y-%m-%d}";
      };

      "network" = {
        format = "{ifname}";
        format-wifi = "  {essid} ({signalStrength}%)";
        format-ethernet = "󰈀  {ifname}";
        format-disconnected = "󰤯  Disconnected";
        tooltip = true;
        tooltip-format = "{ifname}";
        max-length = 50;
      };

      "pulseaudio" = {
        format = "  {volume}%";
        format-muted = " Muted";
        tooltip = false;
      };

      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        format = "{name}";
      };

      "temperature" = {
        format = " {temperatureC}°C";
        format-alt = " {temperatureF}°F";
        tooltip = false;
      };
      "cpu" = {
        interval = 10;
        format = "  {usage}%";
        max-length = 10;
      };
      "memory" = {
        interval = 30;
        format = "  {percentage}%";
        tooltip = true;
        tooltip-format = "{total} Available";
        max-length = 10;
      };
      "disk" = {
        format = "  {percentage_used}%";
      };
      "battery" = {
        format = "󰂀 {capacity}%";
        tooltip = true;
        tooltip-format = "{time}";
      };
      "custom/power" = { # Eventually make it turn off the computer
        format = "⏻";
        tooltip = false;
      };

    };
    style = ./style.css;
  };
}
