{
  inputs,
  self,
  ...
}: {
  flake.homeModules.homePackages = {pkgs, ...}: let
    system = pkgs.stdenv.hostPlatform.system;
    cclip = inputs.cclip.packages.${system}.default;
    fsel = inputs.fsel.packages.${system}.default;
    zen-browser = inputs.zen-browser.packages.${system}.default;
    selfPackages = self.packages.${system};
  in {
    home.packages = with pkgs;
      [
        aegis
        alsa-utils
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
        delta
        duf
        dust
        easyeffects
        element
        eza
        fd
        feh
        file
        flameshot
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
        libreoffice-fresh
        lsfg-vk
        lsfg-vk-ui
        ltrace
        lutgen
        mpc
        mpv
        mtr
        nitch
        nmap
        onefetch
        ouch
        pavucontrol
        pixelorama
        playerctl
        qbittorrent
        radare2
        ripgrep
        rm-improved
        rmpc
        sbctl
        sd
        strace
        tealdeer
        udisks
        wget
        wifite2
        wiremix
        wl-clipboard
        xclip
        xxd
        xxh
        yq
        yt-dlp
        zen-browser
        zig
        zoxide
      ]
      ++ (with selfPackages; [savesave]);
  };
}
