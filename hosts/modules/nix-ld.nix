{
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      xorg.libXxf86vm
      xorg.libXext
      xorg.libX11
      glib

    ];
  };
}
