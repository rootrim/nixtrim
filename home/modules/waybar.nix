{
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = {

      zabar = {

        layer = "top";
        position = "top";
        height = 30;
        spacing = 5;
        output = [
          "eDP-1"
        ];
        modules-left = [
          "custom/blank"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "custom/media"
        ];
        modules-right = [
          "wireplumber"
          "custom/brightness"
          "network"
          "cpu"
          "memory"
          "battery"
          "clock"
          "tray"
          "custom/blank"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          #on-click = "activate";
        };

        "hyprland/window" = {
          format = "  {}";
          max-length = 50;
        };

        "custom/spotify" = {
          exec = "playerctl -p spotify metadata --format '  {{artist}} - {{title}}'";
          interval = 1;
          on-click = "playerctl -p spotify play-pause";
          on-scroll-up = "playerctl -p spotify next";
          on-scroll-down = "playerctl -p spotify previous";
          max-length = 50;
          format-icons = {
            Playing = "";
            Paused = "";
          };
          on-click-middle = "spotify";
        };

        "custom/media" = {
          exec = "playerctl metadata --format '{{artist}} - {{title}}'";
          interval = 1;
          on-click = "playerctl play-pause";
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
          max-length = 50;
          format-icons = {
            Playing = "";
            Paused = "";
          };
        };

        "custom/brightness" = {
          exec = "brightnessctl -m | awk -F, '{print substr($4, 0, length($4)-1)}'";
          format = "󰃠 {}";
          on-scroll-up = "brightnessctl s +10%";
          on-scroll-down = "brightnessctl s 10%-";
          interval = 1;
        };

        "custom/blank" = {
          format = " ";
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈀  {ipaddr}";
          format-disconnected = "  Offline";
          tooltip = false;
        };

        "tray" = {
          icon-size = 14;
          spacing = 10;
        };

        "clock" = {
          format = "  {:%H:%M}";
          tooltip = "  {:%d/%m/%Y}";
        };

        "cpu" = {
          format = "  {usage}%";
          interval = 2;
        };

        "memory" = {
          format = "  {}%";
          interval = 5;
        };

        "temperature" = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "wireplumber" = {
          scroll-step = 5;
          format = "{icon}  {volume}%";
          format-bluetooth = "{icon}  {volume}% ";
          format-bluetooth-muted = "  {icon}";
          format-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

      };

    };

    style = # css
      ''
        * {
            border: 1px;
            font-family: "JetBrainsMono Nerd Font";
            font-size: 13px;
            min-height: 0;
        }

        window#waybar {
            /*background: rgba(40, 42, 54, 0.9);*/
            /*background-color: rgba(0,0,0,0);*/
            /*color: #f8f8f2;*/
        }

        #workspaces button {
            padding: 0 8px;
            margin: 5px 3px;
            /*color: #6272a4;*/
            /*background: #44475a;*/
            border-radius: 100px;
        }

        #workspaces button.active {
            /*color: #50fa7b;*/
        }

        #window {
            /*color: #ff79c6;*/
            padding: 0 12px;
            /*margin: 5 3px;
            background: #44475a;
            border-radius: 100px;*/
        }

        #cpu, #memory, #network, #wireplumber, #clock, #battery {
            padding: 0 10px;
            margin: 5px 3px;
            /*background: #44475a;*/
            border-radius: 100px;
        }

        #custom-media, #custom-spotify {
            /*color: #1db954;*/
            /*color: #50fa7b;*/ 
            padding: 0 10px;
            margin: 5px 3px;  
            /*background: #44475a;*/  
            border-radius: 100px;  
        }  

        #custom-media:hover, #custom-spotify:hover {
            /*background: #6272a4;*/
            transition: 0.3s;
        }

        #custom-brightness {
            /*background: #44475a;*/
            padding: 0 10px;
            margin: 5px 3px;
            border-radius: 100px;
        }

        #clock {
            /*color: #bd93f9;*/
        }
      '';

  };
}
