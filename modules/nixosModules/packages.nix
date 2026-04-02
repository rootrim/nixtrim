{inputs, ...}: {
  flake.nixosModules.packages = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.pinned inputs.aegis.overlays.default];
  };
}
