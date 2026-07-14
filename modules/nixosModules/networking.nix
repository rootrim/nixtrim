{
  flake.nixosModules.networking = {
    networking = {
      nameservers = ["127.0.0.1"];
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

      resolvconf = {
        enable = true;
        useLocalResolver = true;
      };

      networkmanager = {
        enable = true;
        dns = "none";
        wifi.powersave = true;
        settings = {
          connection = {
            "ipv6.method" = "disabled";
          };
        };
      };
    };

    services.dnscrypt-proxy = {
      enable = true;

      settings = {
        listen_addresses = ["127.0.0.1:53"];

        ipv4_servers = true;
        ipv6_servers = false;

        dnscrypt_servers = false;
        doh_servers = true;

        require_dnssec = true;
        require_nolog = true;
        require_nofilter = false;

        # Disable downloading resolver lists
        sources = {};

        # Define Quad9 manually
        static = {
          quad9 = {
            stamp = "sdns://AgMAAAAAAAAABzkuOS45LjkgsBkgdEu7dsmrBT4B4Ht-BQ5HPSD3n3vqQ1-v5DydJC8SZG5zOS5xdWFkOS5uZXQ6NDQzCi9kbnMtcXVlcnk";
          };
        };

        server_names = ["quad9"];
      };
    };

    services.resolved.enable = false;
  };
}
