{
  pkgs,
  config,
  lib,
  ...
}:
let
  aliases = {
    "tree" = "eza --tree";
    "nv" = "nvim";
    "nvx" = "nix run github:rootrim/nvix";

    "ll" =
      "eza -la --sort name --group-directories-first --no-permissions --no-filesize --no-user --no-time";
    "l" = "ls";

    ":q" = "exit";
    "q" = "exit";

    "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/nixtrim#zenith";
    "reflake" = "nix flake update --flake ~/.config/nixtrim#zenith";

    "konodioda" = "onefetch -i def.jpg --nerd-fonts";
  };
in
{
  options.shellAliases =
    with lib;
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
    '';
  };
}
