{
  flake.homeModules.jujutsu = {
    programs.jujutsu = {
      enable = true;
      settings = {
        user.name = "jonitrium";
        user.email = "jonitrium@noreply.codeberg.org";
        ui.default-command = "log";
      };
    };
  };
}
