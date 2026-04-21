{
  flake.homeModules.hyprpaper = let
    wall = ./jelly.jpg;
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
