{
  perSystem = {pkgs, ...}: {
    devShells = {
      gaming = import ./gaming.nix {inherit pkgs;};
      pentest = import ./pentest.nix {inherit pkgs;};
      reverse = import ./reverse.nix {inherit pkgs;};
    };
  };
}
