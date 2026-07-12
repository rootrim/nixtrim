{
  flake.nixosModules.networking = {
    networking = {
      nameservers = ["1.1.1.1"];
      nftables.enable = true;

      enableIPv6 = false;

      extraHosts = ''
        # Pinned: ISP resets TCP/TLS to Mojang/Azure CDN edge (81.8.66.123) for
        # multiple subdomains 150.171.110.54 confirmed working for piston-data,
        # piston-meta, sessionserver.mojang and api.mojang as of 2026-07-11
        150.171.110.54 piston-data.mojang.com
        150.171.110.54 piston-meta.mojang.com
        150.171.110.54 sessionserver.mojang.com
        150.171.110.54 api.mojang.com
      '';

      networkmanager = {
        enable = true;
        wifi.powersave = true;
        settings = {
          connection = {
            "ipv6.method" = "disabled";
          };
        };
      };
    };
  };
}
