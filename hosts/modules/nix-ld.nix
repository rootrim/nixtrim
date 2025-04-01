{pkgs}:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      xorg.libXxf86vm
      xorg.libXext
      glib
    ];
  };
}
