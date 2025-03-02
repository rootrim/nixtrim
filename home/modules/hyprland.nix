{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    systemd.enable = false;
    extraConfig = ''
      $configs = $HOME/.config/nixtrim/dots/hypr/
      monitor=eDP-1,1920x1080@120.00200,0x0,1
      source=$configs/mocha.conf
      source=$configs/gruvbox.conf
      source=$configs/startup.conf
      source=$configs/debug.conf
      source=$configs/general.conf
      source=$configs/decoration.conf
      source=$configs/animations.conf
      source=$configs/layouts.conf
      source=$configs/plugins.conf
      source=$configs/devices.conf
      source=$configs/binds.conf
      source=$configs/windowrules.conf
    '';
  };
}
