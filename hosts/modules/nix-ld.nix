{
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = false;
    libraries = with pkgs; [
      xorg.libXxf86vm
      xorg.libXext
      xorg.libX11
      glib
    ];
  };
}
