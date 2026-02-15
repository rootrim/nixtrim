{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libGL
      libXxf86vm
      libXext
      libX11
      glib
      zlib
      alsa-lib
      libxkbcommon
      SDL2
      SDL2_image
    ];
  };
}
