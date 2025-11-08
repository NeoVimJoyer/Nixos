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
      ];

      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        format = "";
        format-icons = {
          "1" = "[]";
          "2" = "[]";
          "3" = "[]";
          "4" = "[]";
          "5" = "[]";
          "6" = "[]";
          "7" = "[]";
          "8" = "[]";
          "9" = "[]";
          "10" = "[]";
        };
      };

      "temperature" = {
        format = "[] {temperatureC}°C";
        format-alt = "[] {temperatureF}°F";
        tooltip = false;
      };
      "cpu" = {
        interval = 10;
        format = "[] {usage}%";
        max-length = 10;
      };
      "memory" = {
        interval = 30;
        format = "[] {percentage}%";
        tooltip = true;
        tooltip-format = "{total} Available";
        max-length = 10;
      };
      "disk" = {
        format = "[] {percentage_used}%";
      };
      "battery" = {
        format = "[] {capacity}%";
        tooltip = true;
        tooltip-format = "{time}";
      };
    };
    style = ./style.css;
  };
}
