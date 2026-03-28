{
  flake.nixosModules.tabletDriver = {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
