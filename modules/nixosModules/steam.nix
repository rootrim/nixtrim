{
  flake.nixosModules.steam = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = false;
      remotePlay.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
