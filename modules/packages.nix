{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ inputs.aegis.overlays.default ];

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

  programs.xppen = {
    enable = false;
    package = pkgs.xppen_3;
  };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
}
