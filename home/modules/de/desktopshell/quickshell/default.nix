{ pkgs, inputs, ... }:
let
  quickshell =
    inputs.quickshell.packages."${pkgs.stdenv.hostPlatform.system}".default;
in {
  home.packages = with pkgs; [
    qt6.qtimageformats
    qt6.qt5compat
    qt6.qtmultimedia
    qt6.qtdeclarative
    quickshell
    grim
    imagemagick
  ];

  xdg.configFile."quickshell".source = ./shell;
}
