{
  networking = {
    nameservers = [ "9.9.9.9" "8.8.8.8" "1.1.1.1" ];

    networkmanager = {
      enable = true;
      wifi.powersave = true;
      #dns = "none";
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
