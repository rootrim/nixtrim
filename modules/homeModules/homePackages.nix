{
  inputs,
  self,
  ...
}: {
  flake.homeModules.homePackages = {pkgs, ...}: let
    system = pkgs.stdenv.hostPlatform.system;
    cclip = inputs.cclip.packages.${system}.default;
    fsel = inputs.fsel.packages.${system}.default;
    whoisgod = inputs.whoisgod.packages.${system}.default;
    kanarenshu = inputs.kanarenshu.packages.${system}.default;
    fjordlauncher = inputs.fjordlauncher.packages.${system}.default;
    selfPackages = self.packages.${system};
  in {
    home.packages = with pkgs;
      [
        aegis
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
        duf
        dust
        easyeffects
        element
        espeak
        eza
        fd
        feh
        ffmpeg
        file
        fsel
        fzf
        gcc
        gdb
        gimp
        git
        glow
        gnumake
        godot
        heroic
        hyprpicker
        hyprshade
        hyprshot
        imagemagick
        jq
        kanarenshu
        kdePackages.kdenlive
        kicad
        krita
        lavat
        libreoffice-fresh
        lsfg-vk
        lsfg-vk-ui
        ltrace
        lutgen
        mpc
        mpvpaper
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
        wf-recorder
        wget
        whoisgod
        wifite2
        wiremix
        wl-clipboard
        xxd
        yq
        yt-dlp
        zig
        zoxide
        fjordlauncher
      ]
      ++ (with selfPackages; [savesave]);
  };
}
