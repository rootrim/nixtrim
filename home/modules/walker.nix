{inputs,...}:
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      search.placeholder = "What will be runned next?";
      ui.fullscreen = true;
      list = {
        height = 200;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
    };
  };
}
