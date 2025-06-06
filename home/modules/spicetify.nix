{
  #config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = false;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];
    };
}
