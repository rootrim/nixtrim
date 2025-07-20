{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  system = "x86_64-linux";
  quickshell = inputs.quickshell.packages."${system}".default;
in
{
  home.packages = with pkgs; [
    qt6.qtimageformats # amog
    qt6.qt5compat # shader fx
    qt6.qtmultimedia # flicko shell
    qt6.qtdeclarative # qtdecl types in path
    (quickshell.override (prevqs: {
      debug = true;
      qt6 = prevqs.qt6.overrideScope (
        _: prevqt: {
          qtdeclarative = prevqt.qtdeclarative.overrideAttrs (prev: {
            cmakeBuildType = "Debug";
            dontStrip = true;
          });
        }
      );
    }))
    grim
    imagemagick # screenshot
  ];

  #xdg.configFile."quickshell/manifest.conf".text = lib.generators.toKeyValue { } {
  #  shell = "./shell";
  #  greeter = "./shell/greeter.qml";
  #};
}
