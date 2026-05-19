{self, ...}: {
  flake.homeModules.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      xwayland.enable = true;
      systemd.enable = true;

      extraConfig =
        # lua
        ''
          require("autostart")
          require("animations")
          require("binds")
          require("decors")
          require("rules")
          require("settings")
          hl.config({
            general = {
              col = {
                active_border = "${self.theme.base01}",
                inactive_border = "${self.theme.base01}",
              }
            }
          })
        '';
    };
    services.hyprpolkitagent.enable = true;

    home.file = {
      ".config/hypr/animations.lua".source = ./luaconf/animations.lua;
      ".config/hypr/binds.lua".source = ./luaconf/binds.lua;
      ".config/hypr/decors.lua".source = ./luaconf/decors.lua;
      ".config/hypr/rules.lua".source = ./luaconf/rules.lua;
      ".config/hypr/settings.lua".source = ./luaconf/settings.lua;
      ".config/hypr/autostart.lua".source = ./luaconf/autostart.lua;
    };
  };
}
