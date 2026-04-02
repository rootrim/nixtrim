{
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "trim";
          email = "omuaz01@gmail.com";
        };
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        core.editor = "nvim";
        color.ui = "auto";
      };
    };

    programs.gh = {enable = true;};
  };
}
