{
  programs.git = {
    enable = true;
    userName = "nixtrim";
    userEmail = "omuaz01@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      color.ui = "auto";
    };
  };

  programs.gh = { enable = true; };
}
