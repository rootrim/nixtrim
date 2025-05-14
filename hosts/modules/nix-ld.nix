{
  pkgs,
  ...
}:
{
  programs.nix-ld = {
    enable = false;
    dev.enable = true;
    libraries = with pkgs; [
      xorg.libXxf86vm
      xorg.libXext
      xorg.libX11
      glib
    ];
  };
}
