{ ... }:
let
  colors = import ./../../../colors/tron.nix;
in
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
        on-click = "shutdown now";
      };

    };
    style = ''
      * {
        font-family: "Maple Mono";
        font-size: 12;
        min-height: 12px;
        min-width: 0px;
        border: none;
        border-radius: 0;
        box-shadow: none;
        text-shadow: none;
        padding: 0px;
      }

      window#waybar {
        transition-property: black;
        transition-duration: 0.5s;
        border-radius: 8px;
        border: 2px solid ${colors.blue};
        background: ${colors.black};
        color: ${colors.blue};
      }

      menu,
      tooltip {
        border-radius: 8px;
        padding: 2px;
        border: 1px solid ${colors.blue};
        background: ${colors.black};
      }

      menu label,
      tooltip label {
        font-size: 14px;
        color: ${colors.blue};
      }

      .modules-right,
      .modules-left {
        margin: 6px 10px 6px 10px;
      }

      #custom-icon,
      #clock,
      #network,
      #pulseaudio,
      #temperature,
      #cpu,
      #memory,
      #disk,
      #battery,
      #custom-power {
        margin-left: 8px;
        margin-right: 8px;
      }

      #custom-icon {
        font-size: 15px;
      }

      #workspaces {
        margin-left: 8px;
        margin-right: 8px;
      }

      #workspaces button {
        padding-left: 8px;
        padding-right: 8px;
        color: ${colors.blue};
      }

      #workspaces button:hover {
        background: ${colors.blue};
        color: ${colors.black};
      }

      #workspaces button.active,
      #workspaces button.focused {
        color: ${colors.white};
      }
    '';
  };
}
