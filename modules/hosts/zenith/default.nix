{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.zenith = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.zenithConfiguration
    ];
  };
}
