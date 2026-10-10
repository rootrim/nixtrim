{
  flake.nixosModules.security = {
    security.sudo.enable = false;
    security.doas.enable = true;
    security.doas.extraRules = [
      {
        groups = ["wheel"];
        keepEnv = true;
        persist = true;
      }
    ];
  };
}
