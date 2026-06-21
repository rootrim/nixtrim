{
  flake.nixosModules.boot = {lib, ...}: {
    boot = {
      loader = {
        systemd-boot.enable = lib.mkForce false;
        timeout = 5;
        limine = {
          enable = true;
          enrollConfig = true;
          efiSupport = true;
          maxGenerations = 5;
          secureBoot.enable = true;
        };
      };
    };
  };
}
