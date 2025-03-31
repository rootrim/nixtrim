{
  pkgs,
  inputs,
  ...
}:

let
  system = "x86_64-linux";
  zen-browser = inputs.zen-browser.packages."${system}".default;
  superfile = inputs.superfile.packages.${system}.default;
  astal = inputs.astal.packages.${system}.default;
  yazi = inputs.yazi.packages.${system}.default;
  sherlock = inputs.sherlock.packages.${system}.default;
  deskinator = inputs.self.packages.${system}.deskinator;
in {


  imports = [
    ./modules/default.nix
  ];

  home.packages = with pkgs; [
    zen-browser
    superfile
    astal
    yazi
    deskinator
    sherlock
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
  ];
  
  home = {
    username = "rootrim";
    homeDirectory = "/home/rootrim";
    sessionVariables = {};
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
