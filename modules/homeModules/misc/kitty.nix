{
  flake.homeModules.kitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      themeFile = "GruvboxMaterialDarkMedium";
      keybindings = {
        "--allow-fallback=shifted,ascii alt+shift+q" = "close_window";
        "--allow-fallback=shifted,ascii alt+shift+r" = "start_resizing_window";
        "ctrl+enter" = "focus_visible_window";
        "--allow-fallback=shifted,ascii ctrl+shift+n" = "new_tab";
        "ctrl+shift+l" = "next_tab";
        "ctrl+shift+h" = "previous_tab";
        "--allow-fallback=shifted,ascii ctrl+shit+9" = "change_font_size all -2.0";
        "--allow-fallback=shifted,ascii ctrl+shit+0" = "change_font_size all +2.0";
        "--allow-fallback=shifted,ascii ctrl+shift+e" = "open_url_with_hints";
        "--allow-fallback=shifted,ascii ctrl+shift+u" = "kitten unicode_input";
      };
      settings = {
        enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
        enable_audio_bell = true;
        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";
      };
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
