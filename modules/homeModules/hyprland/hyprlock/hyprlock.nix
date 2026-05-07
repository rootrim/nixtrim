{self, ...}: {
  flake.homeModules.hyprlock = let
    bg = ./bg.png;
    layer1 = ./layer1.png;
    layer2 = ./layer2.png;

    font = "Maple Mono NF";
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
            path = "${bg}";
          }
          {
            monitor = "";
            zindex = 1;
            path = "${layer1}";
          }
          {
            monitor = "";
            zindex = 2;
            path = "${layer2}";
          }
        ];

        input-field = [
          {
            monitor = "";

            zindex = 2;

            size = "300, 50";
            valign = "center";
            halign = "center";
            position = "0, -300";

            outline_thickness = 3;

            font_color = "rgb(${self.themeNoHash.base06})";
            outer_color = "rgb(${self.themeNoHash.base0B})";
            inner_color = "rgb(${self.themeNoHash.base00})";
            check_color = "rgb(${self.themeNoHash.base0B})";
            fail_color = "rgb(${self.themeNoHash.base08})";
            capslock_color = "rgb(${self.themeNoHash.base0D})";

            fade_on_empty = true;
            placeholder_text = "Enter Password";
            fail_text = "Wrong Password";

            dots_spacing = 0.2;
            dots_center = true;
          }
        ];

        label = [
          {
            monitor = "";
            zindex = 1;
            text = ''cmd[update:30000] echo "$(date +"%M")"'';
            color = "rgb(${self.themeNoHash.base06})";
            font_size = 170;
            font_family = font;
            position = "420, -55";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = ''cmd[update:30000] echo "$(date +"%H")"'';
            color = "rgb(${self.themeNoHash.base06})";
            font_size = 170;
            font_family = font;
            position = "-220, 30";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
