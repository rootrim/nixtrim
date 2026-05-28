{
  flake.homeModules.hyprpaper = {pkgs, ...}: let
    wall = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/x1/wallhaven-x13qzz.jpg";
      sha256 = "1flb25lyxmcmvmmb22d5xx6djik4jjh48bp2ad286dza3gcs7v4r";
    };
  in {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = ["${wall}"];
        wallpaper = [
          {
            monitor = "eDP-1";
            path = "${wall}";
          }
        ];
      };
    };
  };
}
