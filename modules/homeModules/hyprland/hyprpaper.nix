{
  flake.homeModules.hyprpaper = {pkgs, ...}: let
    wall = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/1q/wallhaven-1qpeq3.png";
      sha256 = "0di0gglxqswv1d88lqw2g7i64h4cvn5nrilpnmjc29829as2v832";
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
