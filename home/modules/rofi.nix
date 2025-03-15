{
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    #font = "Cascadia Code 14";
    #theme = "~/.config/nixtrim/dots/rofi/config.rasi";
    plugins = with pkgs; [
      rofimoji
      rofi-power-menu
    ];

  };
}
