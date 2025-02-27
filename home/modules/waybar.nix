{
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    settings = builtins.toJSON {

      layer = "top";
      position = "top";
      height = 28;
      output = [
        "eDP-1"
      ];
      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "mpris"
      ];
      modules-right = [
        "temperature"
        "memory"
        "cpu"
        "wireplumber"
        "backlight"
        "battery"
        "clock"
        "tray"
      ];
  
      "hyprland/workspaces"= {
        format= "{icon}";
      };


      "hyprland/window"= {
        format = "{title}";
        max-length = 40;
        all-outputs = true;
      };


      "mpris"= {
        format  = " {status_icon} {dynamic}";
        interval  = 1;
        dynamic-len  = 40;
        status-icons  = {
          playing = "▶";
          paused = "⏸";
          stopped = "";
        };
        dynamic-order = ["title" "artist"];
        ignored-players = ["firefox"];
      };


      tray = {
        icon-size = 14;
        spacing = 10;
      };


      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };

      memory = {
        format = "{used}G ";
      };

      temperature = {
        thermal-zone = 2;
        hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
        critical-threshold = 80;
        format-critical = "{temperatureC}°C {icon}";
        format = "{temperatureC}°C {icon}";
        format-icons = ["" "" ""];
      };

      backlight = {
        format = "{icon} {percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-full = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{icon} {time}";
        format-icons = ["" "" "" "" ""];
      };
      
       wireplumber = {
         scroll-step = 5;
         format = "{icon} {volume}%";
         format-bluetooth = "{icon} {volume}% ";
         format-bluetooth-muted = " {icon}";
         format-muted = "";
         format-icons = {
           headphone = "";
           hands-free = "";
           headset = "";
           phone = "";
           portable = "";
           car = "";
           default = ["" "" ""];
        };
         on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };

    };

    style = ''
* {
  font-size: 14px;
}

window#waybar {
  font-family:
    FontAwesome,
    Caskaydia Cove NFM;
  background-color: transparent;
  color: #ebdbb2;
  transition-property: background-color;
  transition-duration: 0.5s;
  background-color: #282828;
}

#workspaces button {
  padding: 0 5px;
  background-color: transparent;
  color: #ebdbb2;
}

#workspaces button:hover {
  color: #d79921;
}

#workspaces button.active {
  border-top: 3px solid #d79921;
  border-radius: 0px;
}

#workspaces button.focused {
  background-color: #665c54;
}

#workspaces button.urgent {
  border-top: 3px solid #fb4934;
  border-radius: 0px;
}

#idle_inhibitor,
#temprature,
#memory,
#cpu,
#cava,
#scratchpad,
#mode,
#window,
#clock,
#battery,
#backlight,
#wireplumber,
#mpris,
#load {
  padding: 0 10px;
  background-color: #282828;
  color: #ebdbb2;
}

#mode {
  background-color: #689d6a;
  color: #282828;
  /* box-shadow: inset 0 -3px #ffffff; */
}

#tray {
  padding: 0 10px;
  background-color: #282828;
  color: #ebdbb2;
}
/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
  margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
  margin-right: 0;
}

#cava {
  padding: 0 5px;
}

#battery.charging,
#battery.plugged {
  background-color: #98971a;
  color: #282828;
}

@keyframes blink {
  to {
    background-color: #282828;
    color: #ebdbb2;
  }
}

/* Using steps() instead of linear as a timing function to limit cpu usage */
#battery.critical:not(.charging) {
  background-color: #cc241d;
  color: #ebdbb2;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: steps(12);
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

label:focus {
  background-color: #000000;
}

#wireplumber.muted {
  background-color: #458588;
}

#tray > .passive {
  -gtk-icon-effect: dim;
}

#tray > .needs-attention {
  -gtk-icon-effect: highlight;
}

#mpris.playing {
  background-color: #d79921;
  color: #282828;
}

#tray menu {
  font-family: sans-serif;
}

#scratchpad.empty {
  background: transparent;
}
    '';



  };
}
