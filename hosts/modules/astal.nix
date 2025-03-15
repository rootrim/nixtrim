{ pkgs, ags, astal, ... }:
let
  system  = "x86_64-linux";
in
{
  packages.${system}. default = pkgs.stdenvNoCC.mkDerivation rec {
    name = "deskshell";
    src = ./dots/astal;

    nativeBuildInputs = [
      ags.packages.${system}.default
      pkgs.wrapGAppsHook
      pkgs.gobject-introspection
    ];

    buildInputs = with astal.packages.${system}; [
      astal3
      io
      # any other package
    ];

    installPhase = ''
      mkdir -p $out/bin
      ags bundle app.ts $out/bin/${name}
    '';
  };
}
