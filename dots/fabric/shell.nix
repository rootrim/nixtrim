{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs;[
    python312
    gtk3
    gtk-layer-shell
    ninja
    cmake
    pkgconf
    pkg-config
    cairo
    gobject-introspection
    python312Packages.pygobject3
    python312Packages.pygobject-stubs
    python312Packages.loguru
    python312Packages.psutil
  ];

  shellHook = ''
    python -m venv .venv
    source .venv/bin/activate
    pip install git+https://github.com/Fabric-Development/fabric.git
    zsh
  '';
}
