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
        "--dpi-desync=fake,disorder2"
        "--dpi-desync-ttl=1"
        "--dpi-desync-autottl=2"
      ];
      whitelist = ["discord.com"];
    };
    blueman.enable = true;
    upower.enable = true;
    flatpak.enable = true;
    udisks2.enable = true;
    NetworkManager-wait-online.enable = false;
  };
}
