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
          require("dvd")
          require("zawarudo")
          require("stairs")
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

    xdg.configFile = {
      "hypr/animations.lua".source = ./luaconf/animations.lua;
      "hypr/binds.lua".source = ./luaconf/binds.lua;
      "hypr/decors.lua".source = ./luaconf/decors.lua;
      "hypr/rules.lua".source = ./luaconf/rules.lua;
      "hypr/settings.lua".source = ./luaconf/settings.lua;
      "hypr/autostart.lua".source = ./luaconf/autostart.lua;
      "hypr/dvd.lua".source = ./luaconf/dvd.lua;
    };
  };
}
