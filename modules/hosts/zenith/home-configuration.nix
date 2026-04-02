{self, ...}: {
  flake.nixosModules.zenithHomeRootrim = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.rootrim = {
      imports = [
        self.homeModules.rootrimHome
        self.homeModules.homePackages
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
