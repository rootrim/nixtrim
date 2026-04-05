{
  flake.nixosModules.networking = {
    networking = {
      nameservers = ["1.1.1.1"];

      networkmanager = {
        enable = true;
        wifi.powersave = true;
      };
    };
  };
}
