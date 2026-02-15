{
  description = "Lunar Chimera: Zenith Designs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    stylix.url = "github:danth/stylix/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = { url = "github:hyprwm/Hyprland"; };
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      hostname = "zenith";
      username = "rootrim";
      arch = "x86_64-linux";
    in {

      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/${hostname}/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home/home.nix;
              home-manager.extraSpecialArgs = { inherit inputs username; };
            }
          ];

        };
      };

      homeConfigurations = {
        nixtrim = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${arch};
          home.directory = "/home/${username}";
          user = "${username}";
          configuration = import ./home/home.nix;
        };
      };
    };
}
