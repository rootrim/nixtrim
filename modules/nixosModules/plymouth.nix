{
  flake.nixosModules.dynamiku = {pkgs, ...}: {
    boot.plymouth = {
      enable = true;
      themePackages = [pkgs.mikuPlymouth];
      theme = "MikuPlymouth";
    };
  };
}
