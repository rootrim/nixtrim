{ inputs, pkgs, system, ... }:
let inherit (inputs) quickshell;
in {
  home.packages = with pkgs; [
    qt6.qtimageformats
    qt6.qt5compat
    qt6.qtmultimedia
    qt6.qtdeclarative
    quickshell.packages.${system}.default
    grim
    imagemagick
  ];

  xdg.configFile."quickshell/shell".source = "quickshell/shell";
}
