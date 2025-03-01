{
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Cascadia Code 14";
    theme = "../../dots/rofi/config.rasi";

  };
}
