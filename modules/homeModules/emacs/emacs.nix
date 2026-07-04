{
  flake.homeModules.emacs = {pkgs, ...}: {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
      extraPackages = epkgs: [
        epkgs.corfu
        epkgs.dashboard
        epkgs.dirvish
        epkgs.doom-modeline
        epkgs.doom-themes
        epkgs.no-littering
        epkgs.orderless
        epkgs.rustic
        epkgs.vertico
        epkgs.nix-ts-mode
        pkgs.rust-analyzer
        pkgs.clippy
        pkgs.nixd
        pkgs.zls
        pkgs.lua-language-server
        pkgs.tree-sitter-grammars.tree-sitter-nix
      ];
    };
  };
}
