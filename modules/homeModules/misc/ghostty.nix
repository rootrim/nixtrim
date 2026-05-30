{
  flake.homeModules.ghostty = {
    programs.ghostty = {
      enable = true;
      systemd.enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "Gruvbox Material Dark";
        font-family = "Maple Mono NF";
      };
    };
  };
}
