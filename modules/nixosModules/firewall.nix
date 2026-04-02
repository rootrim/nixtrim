{
  flake.nixosModules.firewall = {
    programs.firejail.enable = true;

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };

    programs.proxychains = {
      enable = true;
      proxies.spoofdpi = {
        enable = true;
        type = "http";
        host = "127.0.0.1";
        port = 8080;
      };
    };
  };
}
