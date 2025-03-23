{
  description = "Zenith-Hub - My NixOS + Home Manager flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.11";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fabric = {
      url = "github:Fabric-Development/fabric";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    superfile.url = "github:yorukot/superfile";
    walker.url = "github:abenz1267/walker";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ags,
    astal,
    fabric,
    ...
  } @ inputs: let
    hostname = "zenith";
    username = "rootrim";
    system  = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    #packages.${system}.deskshell = pkgs.stdenvNoCC.mkDerivation rec {
    #  name = "deskshell";
    #  src = ./dots/astal;

    #  nativeBuildInputs = [
    #    ags.packages.${system}.default
    #    pkgs.wrapGAppsHook
    #    pkgs.gobject-introspection
    #  ];

    #  buildInputs = with astal.packages.${system}; [
    #    astal3
    #    io
    #    # any other package
    #  ];

    #  installPhase = ''
    #    mkdir -p $out/bin
    #    ags bundle app.ts $out/bin/${name}
    #    chmod +x $out/bin/${name}
    #  '';
    #};
    packages.${system}.deskinator = pkgs.python3Packages.buildPythonApplication {
      pname = "deskinator";
      version = "0.1.0";
      pyproject = true;

      src = ./dots/fabric;

      build-system = with pkgs.python3Packages; [
        setuptools
      ];

      dependencies = with pkgs.python3Packages; [
        python-daemon
        fabric.packages.${system}.default
      ];
    };

    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/${hostname}/configuration.nix
          inputs.spicetify-nix.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
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
        pkgs = nixpkgs.legacyPackages.${system};
        home.directory = "/home/${username}";
        user = "${username}";
        configuration = import ./home/home.nix;
      };
    };
  };
}
