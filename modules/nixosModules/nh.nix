{
  flake.nixosModules.nh = {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.dates = "daily";
      clean.extraArgs = "--keep-since 4d --keep 3 --optimise";
      flake = "/home/rootrim/.config/nixtrim/";
    };
  };
}
