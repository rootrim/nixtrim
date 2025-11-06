let
  bg = "./bg.png";
  layer1 = "./layer1.png";
  layer2 = "./layer2.png";

  background = "282828";
  foreground = "ebdbb2";
  color0 = "3c3836";
  color1 = "cc241d";
  color2 = "98971a";
  color3 = "d79921";
  color4 = "458588";
  color5 = "b16286";
  color6 = "689d6a";
  color7 = "a89984";
  color8 = "928374";
  color9 = "fb4934";
  color10 = "b8bb26";
  color11 = "fabd2f";
  color12 = "83a598";
  color13 = "d3869b";
  color14 = "8ec07c";
  color15 = "fbf1c7";

  font = "Caskaydia Cove Nerd Font Mono";

in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        immediate_render = true;
        hide_cursor = true;
        no_fade_in = true;
        no_fade_out = true;
        grace = 0;
      };

      background = [
        {
          monitor = "";
          path = bg;
        }
        {
          monitor = "";
          zindex = 1;
          keep_aspect_ratio = true;
          rounding = 0;
          border_size = 0;
          path = layer1;
        }
        {
          monitor = "";
          zindex = 2;
          keep_aspect_ratio = true;
          rounding = 0;
          border_size = 0;
          path = layer2;
        }
      ];

      input-field = [{
        monitor = "";

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
        dots_fade_time = 100;
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
