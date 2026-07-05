{
  flake.homeModules.kitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      themeFile = "GruvboxMaterialDarkMedium";
      font = {
        size = 12;
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF;
      };
      shellIntegration = {
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      quickAccessTerminalConfig = {
        start_as_hidden = false;
        hide_on_focus_loss = false;
        background_opacity = 1.0;
        margin_left = 40;
        margin_right = 40;
        margin_top = 40;
        lines = 15;
        edge = "top";
      };
    };
  };
}
