{ pkgs, ... }:{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    nil
    home-manager
    monocraft
    devenv
    nvidia-docker
    wirelesstools
    cacert
  ];

  programs.zsh =  {
    enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
