{
  programs.firejail.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22];
  };
}
