{
  flake.homeModules.hyprpaper = let
    wall = ./jelly.jpg;
  in {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [
          (toString wall)
        ];
        wallpaper = [
          {
            monitor = "eDP-1";
            path = toString wall;
          }
        ];
      };
    };
  };
}
