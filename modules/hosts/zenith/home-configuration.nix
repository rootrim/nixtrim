{self, ...}: {
  flake.nixosModules.zenithHomeRootrim = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.rootrim = {
      imports = [
        self.homeModules.bacon
        self.homeModules.btop
        self.homeModules.delta
        self.homeModules.fastfetch
        self.homeModules.fish
        self.homeModules.fsel
        self.homeModules.git
        self.homeModules.gtk
        self.homeModules.helix
        self.homeModules.homePackages
        self.homeModules.hypridle
        self.homeModules.hyprland
        self.homeModules.hyprlock
        self.homeModules.hyprpaper
        self.homeModules.jujutsu
        self.homeModules.kitty
        self.homeModules.lazygit
        self.homeModules.mako
        self.homeModules.mangohud
        self.homeModules.nix-your-shell
        self.homeModules.picom
        self.homeModules.qt
        self.homeModules.quickshell
        self.homeModules.qutebrowser
        self.homeModules.rofi
        self.homeModules.rootrimHome
        self.homeModules.starship
        self.homeModules.stylix
        self.homeModules.televison
        self.homeModules.yazi
        self.homeModules.zellij
        self.homeModules.zoxide
      ];
    };
  };

  flake.homeModules.rootrimHome = {
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
        ZIG_GLOBAL_CACHE_DIR = "$HOME/.cache/zig";
        LIBVA_DRIVER_NAME = "iHD";
        NVD_BACKEND = "direct";
        MOZ_DISABLE_RDD_SANDBOX = "1";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_SESSION_TYPE = "wayland";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      };
      stateVersion = "25.11";
    };
  };
}
