{
  networking = {
    nameservers = ["9.9.9.9" "8.8.8.8" "1.1.1.1"];

    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };
}
