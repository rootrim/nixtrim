{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    wirelesstools
    libnotify
    nasm
    xorg.xinit
  ];

  programs.fish.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
