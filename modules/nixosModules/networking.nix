{
  flake.nixosModules.networking = {
    networking = {
      nameservers = ["1.1.1.1" "9.9.9.9" "8.8.8.8"];

      networkmanager = {
        enable = true;
        wifi.powersave = true;
      };
    };
  };
}
