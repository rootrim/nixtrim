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

    "konodioda" = "onefetch -i cover.* --nerd-fonts";

    "dl-yt-musiclist" = "yt-dlp -x --audio-format mp3 --yes-playlist";
  };
in {
  programs.fish = {
    enable = true;
    shellAliases = aliases;
    shellAbbrs = { };
    shellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
      set -g fish_greeting ""
    '';
  };
}
