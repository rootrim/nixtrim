{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.caskaydia-cove
  ];
}
