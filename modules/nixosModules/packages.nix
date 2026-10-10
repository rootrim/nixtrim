{inputs, ...}: {
  flake.nixosModules.packages = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [];
  };
}
