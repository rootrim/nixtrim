{
  #config,
  pkgs,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
  zen-browser = inputs.zen-browser.packages."${system}".default;
  superfile = inputs.superfile.packages.${system}.default;
  astal = inputs.astal.packages.${system}.default;
in {


  imports = [
    ./modules/default.nix
  ];


  home.username = "rootrim";
  home.homeDirectory = "/home/rootrim";

  home.packages = with pkgs; [
    zen-browser
    superfile
    astal
    neofetch
    git
    neovim
    gcc
    python3
    rustc
    cargo
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
  ];
  

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";  # Keep this unchanged.
}
