{
  flake.homeModules.mpv = {pkgs, ...}: {
    programs.mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [
        mpris
      ];
    };
  };
}
