{
  flake.homeModules.ghostty = {
    programs.ghostty = {
      enable = true;
      systemd.enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "Kanagawa Wave";
        font-family = "Maple Mono NF";
        font-style = "Bold";
        adjust-cell-height = 1;
        window-padding-y = 0;
        window-padding-balance = false;
        window-padding-color = "extend-always";
      };
    };
  };
}
