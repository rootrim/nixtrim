{
  flake.homeModules.zellij = {
    programs.zellij = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        theme = "gruvbox-dark";
        pane_frames = false;
        simplified_ui = true;
        mouse_mode = false;
        show_startup_tips = false;
        default_layout = "compact";
      };
    };
  };
}
