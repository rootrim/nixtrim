{
  flake.homeModules.pointerCursor = {pkgs, ...}: {
    home.pointerCursor = {
      enable = true;
      size = 24;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      hyprcursor.enable = true;
      gtk.enable = true;
    };
  };
}
