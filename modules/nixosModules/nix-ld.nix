{
  flake.nixosModules.nix-ld = {pkgs, ...}: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        openssl
        libGL
        glib
        zlib
        alsa-lib
      ];
    };
  };
}
