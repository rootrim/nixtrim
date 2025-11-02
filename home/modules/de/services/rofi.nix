{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    plugins = with pkgs; [ rofimoji ];
  };
}
