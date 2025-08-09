{
  description = "Lunar Chimera: Zenith Designs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    sherlock = {
      url = "github:Skxxtz/sherlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aegis.url = "github:rootrim/aegis";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      hostname = "zenith";
      username = "rootrim";
      system = "x86_64-linux";
    in
    {

      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs username;
          };
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
          pkgs = nixpkgs.legacyPackages.${system};
          home.directory = "/home/${username}";
          user = "${username}";
          configuration = import ./home/home.nix;
        };
      };
    };
}
