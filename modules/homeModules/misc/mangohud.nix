{
  flake.homeModules.mangohud = {
    programs.mangohud = {
      enable = true;
      enableSessionWide = true;
      settings = {
        no_display = true;
      };
    };
  };
}
