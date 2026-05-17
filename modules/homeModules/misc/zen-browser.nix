{
  flake.homeModules.zen-browser = {
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
  };
}
