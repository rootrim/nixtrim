{pkgs, ...}: {
  services = {
    printing.enable = false;
    openssh.enable = true;
    dbus.enable = true;
    geoclue2.enable = true;
    libinput.enable = true;
    udev.packages = [
      pkgs.openocd
    ];
    displayManager = {
      ly = {
        enable = true;
        package = pkgs.ly;
        settings = {
          animation = "matrix";
          animation_frame_delay = 5;
          animation_timeout_sec = 0;
          cmatrix_fg = "0x0000FF00";
          cmatrix_head_col = "0x01FFFFFF";
          cmatrix_min_codepoint = "0x21";
          cmatrix_max_codepoint = "0x7B";
          auth_fails = 1;
        };
      };
    };
    gnome.gnome-keyring = {enable = true;};
    zapret = {
      enable = false;
      params = [
        "nfqws"
        "--dpi-desync=fake"
        "--dpi-desync-repeats=5"
      ];
    };
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
}
