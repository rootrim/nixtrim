{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libGL
      xorg.libXxf86vm
      xorg.libXext
      xorg.libX11
      glib
      zlib
      alsa-lib
      libxkbcommon
      SDL2
      SDL2_image
    ];
  };
}
