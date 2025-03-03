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
      #components = [
      #  "pkcs11"
      #  "secrets"
      #  "ssh"
      #];
    };
  };
}
