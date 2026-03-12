{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org?priority=10"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://unmojang.cachix.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "unmojang.cachix.org-1:OfHnbBNduZ6Smx9oNbLFbYyvOWSoxb2uPcnXPj4EDQY="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
  home-manager.backupFileExtension = "backup";
}
