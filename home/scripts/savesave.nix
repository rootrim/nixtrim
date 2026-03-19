{pkgs}: {
  script = pkgs.writeShellApplication {
    name = "savesave";
    runtimeInputs = with pkgs; [rm-improved];
    text = ''
      if [ "$1" = "save" ]; then
        rip /home/rootrim/.cache/repo/"$2" &>/dev/null
        cp -r "$2" /home/rootrim/.cache/repo/
      elif [ "$1" = "revert" ]; then
        rip "$2" &>/dev/null
        cp -r /home/rootrim/.cache/repo/"$2" .
      fi
    '';
  };
  completion = ''
    complete -c savesave -f
    complete -c savesave -n __fish_use_subcommand -a save   -d "Save a save"
    complete -c savesave -n __fish_use_subcommand -a revert -d "Revert a save"
    complete -c savesave -n "__fish_seen_subcommand_from save"   -F
    complete -c savesave -n "__fish_seen_subcommand_from revert" -a "(ls ~/.cache/repo/)"
  '';
}
