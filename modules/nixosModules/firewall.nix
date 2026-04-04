{
  flake.nixosModules.firewall = {
    programs.firejail.enable = true;

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };

    networking.nftables = {
      enable = true;
    };
  };
}
