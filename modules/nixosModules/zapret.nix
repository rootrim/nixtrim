{
  flake.nixosModules.zapret = {
    zapret = {
      enable = false;
      params = [
        "nfqws"
        "--dpi-desync=fake"
        "--dpi-desync-repeats=5"
      ];
    };
  };
}
