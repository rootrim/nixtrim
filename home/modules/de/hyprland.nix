let configs = ./hypr;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = ''
      monitor=eDP-1,1920x1080@120.00200,0x0,1
      source=${configs}/mocha.conf
      source=${configs}/gruvbox.conf
      source=${configs}/startup.conf
      source=${configs}/debug.conf
      source=${configs}/general.conf
      source=${configs}/decoration.conf
      source=${configs}/animations.conf
      source=${configs}/layouts.conf
      source=${configs}/devices.conf
      source=${configs}/binds.conf
      source=${configs}/windowrules.conf
    '';
  };
}
