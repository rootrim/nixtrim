{
  flake.nixosModules.zapret = {
    services.zapret = {
      enable = false;
      configureFirewall = false;
      params = [
        "--dpi-desync=fake"
        "--dpi-desync-ttl=5"
        "--dpi-desync-fake-http=0x00000000"
      ];
    };
  };
}
