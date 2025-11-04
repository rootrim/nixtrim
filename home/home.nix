{ pkgs, inputs, ... }:

let
  zen-browser =
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default;
in {

  imports = [ ./modules/default.nix ];

  home.packages = with pkgs; [
    zen-browser
    udisks
    alsa-utils
    git
    gcc
    python3
    cargo
    gnumake
    wget
    curl
    tmux
    onefetch
    imagemagick
    fzf
    ripgrep
    fd
    curl
    wl-clipboard
    unzip
    swww
    rofimoji
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
    hyprshot
    feh
    lazydocker
    gimp
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
    qbittorrent
    qgroundcontrol
    bat
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
    mpv
    hyprshade
    tealdeer
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
