{
  flake.nixosModules.steam = {
    programs.steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = false;
      remotePlay.openFirewall = true;
    };
  };
}
