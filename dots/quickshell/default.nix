{ pkgs, ... }: {
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
