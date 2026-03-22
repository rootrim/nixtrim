{pkgs, ...}: {
  programs.nix-ld = {
    enable = false;
    libraries = with pkgs; [
      libGL
      glib
      zlib
      alsa-lib
    ];
  };
}
