{
  pkgs,
  lib,
  config,
  ...
}: let
  #lock = "${pkgs.systemd}/bin/loginctl lock-session";
  lock = "hyprlock -q";

  brillo = lib.getExe pkgs.brillo;

  timeout = 300;
in {
  services.hypridle = {
    enable = true;

    settings = {
      general.lock_cmd = lib.getExe config.programs.hyprlock.package;

      listener = [
        {
          timeout = timeout - 10;
          on-timeout = "${brillo} -O; ${brillo} -u 500000 -S 10";
          on-resume = "${brillo} -I -u 250000";
        }
        {
          inherit timeout;
        }
        {
          timeout = timeout + 10;
          on-timeout = lock;
        }
      ];
    };
  };

  systemd.user.services.hypridle.Unit.After = lib.mkForce "graphical-session.target";
}
