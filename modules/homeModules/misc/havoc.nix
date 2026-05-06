{self, ...}: {
  flake.homeModules.havoc = {pkgs, ...}: {
    programs.havoc = {
      enable = true;
      settings = {
        child.program = "fish";
        terminal = {
          "scroll to bottom on input" = "yes";
        };
        font.path = "${pkgs.maple-mono.NF}/share/fonts/truetype/MapleMono/MapleMono-NF-Regular.ttf";
        colors = {
          foreground = self.theme.base05;
          background = self.theme.base00;
          color0 = self.theme.base00;
          color1 = self.theme.base08;
          color2 = self.theme.base0B;
          color3 = self.theme.base0A;
          color4 = self.theme.base0D;
          color5 = self.theme.base0E;
          color6 = self.theme.base0C;
          color7 = self.theme.base05;
          color8 = self.theme.base03;
          color9 = self.theme.base08;
          color10 = self.theme.base0B;
          color11 = self.theme.base0A;
          color12 = self.theme.base0D;
          color13 = self.theme.base0E;
          color14 = self.theme.base0C;
          color15 = self.theme.base07;
        };
      };
    };
  };
}
