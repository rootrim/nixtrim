{ pkgs, inputs, ... }:

let
  zen-browser = inputs.zen-browser.packages."${pkgs.system}".default;
  yazi = inputs.yazi.packages.${pkgs.system}.default;
in {

  imports = [ ./modules/default.nix ];

  home.packages = with pkgs; [
    zen-browser
    yazi
    udisks
    alsa-utils
    neofetch
    git
    gcc
    python3Full
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    gnumake
    dotnet-sdk_9
    wget
    curl
    lazygit
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
    rmpc
    superTuxKart
    qbittorrent
    qgroundcontrol
    bat
    ianny
    blender
    pixelorama
    osu-lazer-bin
    nvim-pkg
    lutgen
    cava
    qt5.qtquickcontrols2
    qt5.qtlocation
    qt5.qtmultimedia
    file
    radare2
    ltrace
    strace
    fabric-ai
  ];

  home = {
    username = "rootrim";
    homeDirectory = "/home/rootrim";
    sessionVariables = {
      HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      INPUT_METHOD = "fcitx";
      EDITOR = "nvim";
    };
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
