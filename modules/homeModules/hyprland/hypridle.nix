{
  flake.homeModules.hypridle = {
    pkgs,
    lib,
    ...
  }: let
    hyprlock = lib.getExe pkgs.hyprlock;
    timeout = 900;
  in {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = hyprlock;
        };

        listener = [
          {
            inherit timeout;
            on-timeout = hyprlock;
          }
          {
            timeout = timeout + 60;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
