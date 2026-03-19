{
  inputs,
  pkgs,
  username,
  ...
}: let
  cclip = inputs.cclip.packages.${pkgs.stdenv.hostPlatform.system}.default;
  fjordlauncher = inputs.fjordlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default;
  fsel = inputs.fsel.packages.${pkgs.stdenv.hostPlatform.system}.default;
  scripts = map (s: s.script) (import ./scripts/default.nix {inherit pkgs;});
in {
  imports = [./modules/default.nix];

  home.packages = with pkgs;
    [
      aegis
      aircrack-ng
      alsa-utils
      arduino-ide
      bat
      binutils
      brightnessctl
      cargo
      carl
      cava
      cbonsai
      cclip
      cmatrix
      curl
      curl
      delta
      duf
      dust
      easyeffects
      element
      eza
      fabric-ai
      fd
      feh
      file
      fjordlauncher
      flameshot
      fritzing
      fsel
      fzf
      gcc
      gdb
      gimp
      git
      glow
      gnumake
      godot
      helvum
      heroic
      hyprpicker
      hyprshade
      hyprshot
      imagemagick
      jq
      kdePackages.kdenlive
      kicad
      krita
      lazydocker
      libreoffice-fresh
      lsfg-vk
      lsfg-vk-ui
      ltrace
      lutgen
      mpc
      mpv
      mtr
      nitch
      nix-output-monitor
      nmap
      onefetch
      ouch
      pavucontrol
      pixelorama
      playerctl
      python3
      qbittorrent
      qgroundcontrol
      qt5.qtlocation
      qt5.qtmultimedia
      qt5.qtquickcontrols2
      radare2
      ripgrep
      rm-improved
      rmpc
      rofimoji
      sbctl
      sd
      strace
      swww
      tealdeer
      tor-browser
      udisks
      unzip
      wget
      wifite2
      wiremix
      wl-clipboard
      xclip
      xxd
      xxh
      yq
      yt-dlp
      zig
      zoxide
    ]
    ++ scripts;

  home = {
    inherit username;
    homeDirectory = "/home/rootrim";
    sessionVariables = {
      HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      INPUT_METHOD = "fcitx";
      EDITOR = "nvim";
      ZIG_GLOBAL_CACHE_DIR = "$HOME/.cache/zig";
    };
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
