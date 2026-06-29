{
  flake.nixosModules.plymouth = {
    boot.plymouth = {
      enable = false;
    };
  };
}
