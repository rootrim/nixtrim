{
  flake.homeModules.kitty = {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration = {
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      quickAccessTerminalConfig = {
        start_as_hidden = false;
        hide_on_focus_loss = false;
        background_opacity = 1;
      };
    };
  };
}
