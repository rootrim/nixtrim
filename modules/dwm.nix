{ pkgs, inputs, ... }:
let dwm = inputs.dwm.packages."${pkgs.stdenv.hostPlatform.system}".default;
in {
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    xkb.layout = "tr";
    xkb.options = "caps:swapescape";

    windowManager.dwm = {
      enable = true;
      package = dwm;
    };
  };
}
