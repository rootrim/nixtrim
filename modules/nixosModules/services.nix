{
  flake.nixosModules.services = {pkgs, ...}: {
    services = {
      printing.enable = false;
      openssh.enable = true;
      dbus.enable = true;
      geoclue2.enable = true;
      libinput.enable = true;
      udev.packages = [
        pkgs.openocd
      ];
      blueman.enable = true;
      upower.enable = true;
      flatpak.enable = true;
      udisks2.enable = true;
      fstrim.enable = true;
      fwupd.enable = true;
      thermald.enable = true;
      tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        };
      };
      power-profiles-daemon.enable = false;
    };
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
