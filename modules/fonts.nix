{pkgs, ...}: {
  fonts.packages = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-cjk-sans
    maple-mono.NF
  ];
}
