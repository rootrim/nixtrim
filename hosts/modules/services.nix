{ pkgs, ... }:
{
  services = {
    printing.enable = true;
    openssh.enable = true;
    hypridle.enable = true;
    dbus.enable = true;
    xserver = {
      enable = false;
      videoDrivers = ["nvidia"];
      xkb = {
        layout = "tr";
        variant = "";
      };
    };
    libinput.enable = true;
    displayManager = {
      ly = {
        enable = true;
        package = pkgs.ly;
      };
    };
    gnome.gnome-keyring = {
      enable = true;
    };
    zapret = {
      enable = true;
      params = [
        "--dpi-desync=fake,disorder2"
        "--dpi-desync-ttl=1"
        "--dpi-desync-autottl=2"
      ];
      whitelist = [
        "discord.com"
      ];
    };
  };
}
