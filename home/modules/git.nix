{
  programs.git = {
    enable = true;
    userName = "nixtrim";    # Buraya kendi adını yaz
    userEmail = "omuaz01@gmail.com";  # Kendi e-posta adresini yaz
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
      color.ui = "auto";
    };
  };

}
