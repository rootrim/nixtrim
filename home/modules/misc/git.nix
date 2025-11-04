{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "nixtrim";
        email = "omuaz01@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      color.ui = "auto";
    };
  };

  programs.gh = { enable = true; };
}
