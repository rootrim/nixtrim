{
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Cascadia Code Nerd Font Mono 14";

  };
}
