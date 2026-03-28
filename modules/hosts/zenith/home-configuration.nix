{
  flake.nixosModules.zenithHomeRootrim = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.rootrim = {
      imports = [];
    };
  };
}
