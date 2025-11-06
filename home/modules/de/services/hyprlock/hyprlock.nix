let
  bg = "./bg.png";
  layer1 = "./layer1.png";
  layer2 = "./layer2.png";

  background = "rgb(282828)";
  foreground = "rgb(ebdbb2)";
  color0 = "rgb(3c3836)";
  color1 = "rgb(cc241d)";
  color2 = "rgb(98971a)";
  color3 = "rgb(d79921)";
  color4 = "rgb(458588)";
  color5 = "rgb(b16286)";
  color6 = "rgb(689d6a)";
  color7 = "rgb(a89984)";
  color8 = "rgb(928374)";
  color9 = "rgb(fb4934)";
  color10 = "rgb(b8bb26)";
  color11 = "rgb(fabd2f)";
  color12 = "rgb(83a598)";
  color13 = "rgb(d3869b)";
  color14 = "rgb(8ec07c)";
  color15 = "rgb(fbf1c7)";

  font = "Caskaydia Cove Nerd Font Mono";

in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        immediate_render = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = bg;
        }
        {
          monitor = "";
          zindex = 1;
          path = layer1;
        }
        {
          monitor = "";
          zindex = 2;
          path = layer2;
        }
      ];

      input-field = [{
        monitor = "";

        zindex = 2;

        size = "300, 50";
        valign = "center";
        halign = "center";
        position = "0, -300";

        outline_thickness = 3;

        font_color = foreground;
        outer_color = color14;
        inner_color = background;
        check_color = color14;
        fail_color = color1;
        capslock_color = color4;

        fade_on_empty = true;
        placeholder_text = "Enter Password";
        fail_text = "Wrong Password";

        dots_spacing = 0.2;
        dots_center = true;
      }];

      label = [
        {
          monitor = "";
          zindex = 1;
          text = ''cmd[update:30000] echo "$(date +"%M")"'';
          color = foreground;
          font_size = 170;
          font_family = font;
          position = "420, -55";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:30000] echo "$(date +"%H")"'';
          color = foreground;
          font_size = 170;
          font_family = font;
          position = "-220, 30";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
