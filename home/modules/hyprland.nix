{
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    withUWSM = true;
  };
  wayland.windowManager.hyprland.systemd.enable = true;
  wayland.windowManager.hyprland.extraConfig = ''
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

  wayland.windowManager.hyprland = {
  };
}
