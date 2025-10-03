{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [ inputs.aegis.overlays.default ];

  environment.systemPackages = with pkgs; [
    home-manager
    monocraft
    wirelesstools
    libnotify
    nasm
  ];

  programs.zsh.enable = true;

  programs.fish.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
