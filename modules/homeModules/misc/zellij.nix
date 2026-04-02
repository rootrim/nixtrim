{
  flake.homeModules.zellij = {
    programs.zellij = {
      enable = true;
      enableFishIntegration = false;
    };
  };
}
