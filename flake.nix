{
  description = "Lunar Chimera: Zenith Designs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixos-hardware.url = "github:2hexed/nixos-hardware/lenovo-ideapad-15iah7";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {url = "github:hyprwm/Hyprland";};
    aegis = {
      url = "github:rootrim/aegis";
      inputs.flake-parts.follows = "flake-parts";
    };
    cclip = {
      url = "github:rootrim/cclip";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    fsel = {
      url = "github:Mjoyufull/fsel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    whoisgod = {
      url = "github:rootrim/whoisgod";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kanarenshu = {
      url = "github:nuixyz/kanarenshu";
    };
    fjordlauncher = {
      url = "github:hero-persson/FjordLauncherUnlocked";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    (inputs.import-tree ./modules);
}
