{
  description = "Lunar Chimera: Zenith Designs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix/release-25.11";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      inputs.flake-parts.follows = "flake-parts";
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
    aegis,
    flake-parts,
    home-manager,
    lanzaboote,
    nix-cachyos-kernel,
    nixpkgs,
    stylix,
    ...
  }: let
    hostname = "zenith";
    username = "rootrim";
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      flake = {
        nixosConfigurations = {
          "${hostname}" = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs username;};
            modules = [
              lanzaboote.nixosModules.lanzaboote
              ./hosts/${hostname}/configuration.nix
              stylix.nixosModules.stylix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${username} = import ./home/home.nix;
                home-manager.extraSpecialArgs = {inherit inputs username;};
                nixpkgs.overlays = [nix-cachyos-kernel.overlays.pinned aegis.overlays.default];
              }
            ];
          };
        };
      };
      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };
}
