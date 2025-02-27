{
  description = "Zenith-Hub - My NixOS + Home Manager flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
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
    system = "x86_64-linux";
    host = "zenith";
    username = "rootrim";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit nixpkgs;
          inherit home-manager;
          inherit zen-browser;
          inherit spicetify-nix;
          inherit host;
          inherit username;
          inherit system;
          inherit inputs;
        };

        modules = [
          ./hosts/${host}/configuration.nix  # Path to your NixOS configuration file
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
        configuration = import ./home/home.nix;  # Path to your home-manager configuration file
      };
    };
  };
}
