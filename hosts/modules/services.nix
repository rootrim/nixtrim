{ pkgs, ... }:
{
  services = {
    printing.enable = true;
    openssh.enable = true;
    hypridle.enable = true;
    dbus.enable = true;
    xserver = {
      enable = true;
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
  };
}
