{ pkgs, config, lib, ... }:
let
  aliases = {
    "nv" = "nvim";

    "ls" = "eza";
    "la" = "eza -a";
    "ll" = "eza -l";
    "lla" = "eza -la";
    "tree" = "eza --tree";
    "treea" = "eza -a --tree";
    "treela" = "eza -la --tree";

    ":q" = "exit";
    "q" = "exit";

    "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/nixtrim#zenith";
    "reflake" = "nix flake update --flake ~/.config/nixtrim";

    "konodioda" = "onefetch -i cover.* --nerd-fonts";
  };
in {
  options.shellAliases = with lib;
    mkOption {
      type = types.attrsOf types.str;
      default = { };
    };

  config.programs.zsh = {
    shellAliases = aliases // config.shellAliases;
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    initContent = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
      zstyle ':completion:*' menu select
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };

  config.programs.fish = {
    enable = true;
    shellAliases = aliases // config.shellAliases;
    shellInit = ''
      ${pkgs.starship}/bin/starship init fish | source
      ${pkgs.zoxide}/bin/zoxide init fish --cmd cd | source
      set fish_greeting ""
    '';
  };
}
