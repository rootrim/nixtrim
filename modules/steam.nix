{pkgs, ...}: {
  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
