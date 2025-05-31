{
  pkgs,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
  zen-browser = inputs.zen-browser.packages."${system}".default;
  yazi = inputs.yazi.packages.${system}.default;
  sherlock = inputs.sherlock.packages.${system}.default;
  nixvim = inputs.nixvim.packages.${system}.default;
  astal = inputs.astal.packages.${system}.default;
in
{

  imports = [
    ./modules/default.nix
  ];

  home.packages = with pkgs; [
    zen-browser
    yazi
    sherlock
    nixvim
    nodejs_23
    neofetch
    git
    neovim
    gcc
    python3
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    gnumake
    wget
    curl
    lazygit
    kitty
    tmux
    onefetch
    imagemagick
    lua5_1
    luarocks
    fzf
    ripgrep
    fd
    curl
    wl-clipboard
    unzip
    pfetch
    protonvpn-gui
    swww
    rofimoji
    rofi-power-menu
    cliphist
    libreoffice-fresh
    playerctl
    yt-dlp
    hyprpicker
    btop
    nitch
    eza
    zoxide
    cmatrix
    lutris
    hyprshot
    feh
    lazydocker
    gimp
    vesktop
    aircrack-ng
    wifite2
    brightnessctl
    godot
    binutils
    gdb
    kicad
    heroic
    mpc
    fritzing
    astal
  ];

  home = {
    username = "rootrim";
    homeDirectory = "/home/rootrim";
    sessionVariables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
