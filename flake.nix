{
  description = "Lunar Chimera: Zenith Designs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {url = "github:hyprwm/Hyprland";};
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aegis = {
      url = "github:rootrim/aegis";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dwm = {
      url = "github:rootrim/dwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cclip = {
      url = "github:rootrim/cclip";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fsel = {
      url = "github:Mjoyufull/fsel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fjordlauncher = {
      url = "github:hero-persson/FjordLauncherUnlocked";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel = {url = "github:xddxdd/nix-cachyos-kernel/release";};
  };

  outputs = inputs @ {
    flake-parts,
    home-manager,
    nix-cachyos-kernel,
    nixpkgs,
    stylix,
    ...
  }: let
    hostname = "zenith";
    username = "rootrim";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        nixosConfigurations = {
          "${hostname}" = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs username;};
            modules = [
              ./hosts/${hostname}/configuration.nix
              stylix.nixosModules.stylix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = import ./home/home.nix;
                home-manager.extraSpecialArgs = {inherit inputs username;};
                nixpkgs.overlays = [nix-cachyos-kernel.overlays.pinned];
              }
            ];
          };
        };
        formatter.${system} = pkgs.alejandra;
      };
      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
        # ...
      ];
    };
}
