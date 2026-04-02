{
  flake.homeModules.nix-your-shell = {
    programs.nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
      nix-output-monitor = {enable = true;};
    };
  };
}
