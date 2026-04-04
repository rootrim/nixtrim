{
  flake.nixosModules.zapret = {
    services.zapret = {
      enable = true;
      params = [
        "--dpi-desync=fake"
        "--dpi-desync-ttl=5"
        "--dpi-desync-fake-http=0x00000000"
      ];
    };
  };
}
