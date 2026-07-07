{
  flake.homeModules.dwarf-fortress = {pkgs, ...}: {
    home.packages = with pkgs; [
      dwarf-fortress-full
    ];
  };
}
