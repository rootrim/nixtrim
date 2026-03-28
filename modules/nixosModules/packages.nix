{
  flake.nixosModules.packages = {
    nixpkgs.config.allowUnfree = true;
  };
}
