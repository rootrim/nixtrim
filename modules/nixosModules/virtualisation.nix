{
  flake.nixosModules.virtualisation = {
    virtualisation.docker = {
      enable = false;
      enableOnBoot = false;
    };
  };
}
