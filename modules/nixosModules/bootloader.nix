{
  flake.nixosModules.boot = {lib, ...}: {
    boot = {
      loader = {
        systemd-boot.enable = lib.mkForce false;
        efi.canTouchEfiVariables = true;
        timeout = 0;
      };
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };
  };
}
