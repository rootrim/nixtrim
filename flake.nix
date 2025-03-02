{
  description = "Zenith-Hub - My NixOS + Home Manager flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    spicetify-nix,
    ...
  } @ inputs: let
    host = "zenith";
    username = "rootrim";
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/${host}/configuration.nix
          inputs.spicetify-nix.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];

      };
    };

    homeConfigurations = {
      nixtrim = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        home.directory = "/home/${username}";
        user = "${username}";
        configuration = import ./home/home.nix;
      };
    };
  };
}
