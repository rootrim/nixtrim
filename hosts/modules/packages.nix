{pkgs, ...}:{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    nil
    home-manager
    monocraft
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
