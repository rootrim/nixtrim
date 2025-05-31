{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ../../dots/dark-shell;

    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.battery
      fzf
    ];
  };
}
