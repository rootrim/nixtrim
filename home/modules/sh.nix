{
  pkgs,
  config,
  lib,
  ...
}: let
  aliases = {
    "db" = "distrobox";
    "tree" = "eza --tree";
    "nv" = "nvim";

    "ll" = "eza -la --sort name --group-directories-first --no-permissions --no-filesize --no-user --no-time";

    "l" = "ls";

    ":q" = "exit";
    "q" = "exit";

    "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/nixtrim#zenith";
  };
in {
  options.shellAliases = with lib;
    mkOption {
      type = types.attrsOf types.str;
      default = {};
    };

  config.programs.zsh = {
    shellAliases = aliases // config.shellAliases;
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    initExtra = ''
      SHELL=${pkgs.zsh}/bin/zsh
      zstyle ':completion:*' menu select
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      unsetopt BEEP
      eval "$(zoxide init zsh)"
    '';
  };

  config.programs.bash = {
    shellAliases = aliases // config.shellAliases;
    enable = true;
    initExtra = "SHELL=${pkgs.bash}";
  };
}
