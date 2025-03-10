{
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      search.placeholder = "Who will run next?";
      ui.fullscreen = true;
      list = {
        height = 200;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
    };
  };
}
