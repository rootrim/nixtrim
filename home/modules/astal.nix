{ pkgs, system, ags, astal, ... }:
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
