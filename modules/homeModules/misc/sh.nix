{
  flake.homeModules.fish = {
    programs.fish = {
      enable = true;
      generateCompletions = true;
      shellAliases = {
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

        "weather" = "curl wttr.in";

        "clear" = "pyroclear";
      };
      shellAbbrs = {
        "shut" = "shutdown now";
        "dev" = "nix develop ~/.config/nixtrim#";
        "dl-yt-musiclist" = "yt-dlp -x --audio-format mp3 --yes-playlist";
      };
      interactiveShellInit =
        # fish
        ''
          set -g fish_key_bindings fish_vi_key_bindings
          set -g fish_greeting ""
          function fish_mode_prompt
          end
          function fish_prompt
              set -l last_status $status
              set -l job_count (count (jobs -g))

              if set -q SSH_CONNECTION
                  set_color yellow
                  echo -n "$USER@"(prompt_hostname)' '
              end

              set_color cyan
              echo -n (prompt_pwd)

              set_color normal
              echo -n (fish_git_prompt)

              if test $job_count -gt 0
                  set_color magenta
                  echo -n " [$job_count]"
              end

              if test $last_status -ne 0
                  set_color red
                  echo -n " $last_status"
              else
                  set_color green
              end

              switch $fish_bind_mode
                  case default visual
                      echo -n ' < '
                  case '*'
                      echo -n ' > '
              end

              set_color normal
          end
        '';
    };
  };
}
