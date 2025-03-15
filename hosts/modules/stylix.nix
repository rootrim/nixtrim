{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = ../../dots/walls/dekimashita.png;

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      monospace = {
        package = pkgs.cascadia-code;
        name = "Cascadia Code";
      };

      emoji = {
        package = pkgs.twemoji-color-font;
        name = "Twemoji Color Emoji";
      };
    };
  };
}
