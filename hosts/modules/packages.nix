{ pkgs, ... }:{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    monocraft
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
