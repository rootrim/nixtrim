{ pkgs, ... }:
{
  services = {
    printing.enable = true;
    openssh.enable = true;
    hypridle.enable = true;
    dbus.enable = true;
    geoclue2.enable = true;
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "tr";
        variant = "";
      };
    };
    libinput.enable = true;
    udev.packages = [
      #pkgs.platformio-core
      pkgs.openocd
    ];
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
    blueman.enable = true;
    upower.enable = true;
    flatpak.enable = true;
  };

}
