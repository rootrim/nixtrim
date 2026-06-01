{
  flake.nixosModules.sudo = {
    security.sudo.extraConfig =
      # sh
      ''
        Defaults insults
      '';
  };
}
