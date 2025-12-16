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

    "rebuild" = "nh os switch";

    "ff" = "fastfetch";
    "lg" = "lazygit";

    "konodioda" = "onefetch -i cover.* --nerd-fonts";

    "weather" = "curl wttr.in";
  };

  abbrs = {
    "shut" = "shutdown now";

    "dl-yt-musiclist" = "yt-dlp -x --audio-format mp3 --yes-playlist";
  };
in {
  programs.fish = {
    enable = true;
    shellAliases = aliases;
    shellAbbrs = abbrs;
    shellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
      set -g fish_greeting ""
    '';
  };
}
