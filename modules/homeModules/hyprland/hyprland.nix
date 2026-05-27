{self, ...}: {
  flake.homeModules.hyprland = {
    lib,
    pkgs,
    ...
  }: {
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
          require("zawarudo")
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

    xdg.configFile = let
      zawarudo_shader = ./zawarudo.frag;
    in {
      "hypr/animations.lua".source = ./luaconf/animations.lua;
      "hypr/binds.lua".source = ./luaconf/binds.lua;
      "hypr/decors.lua".source = ./luaconf/decors.lua;
      "hypr/rules.lua".source = ./luaconf/rules.lua;
      "hypr/settings.lua".source = ./luaconf/settings.lua;
      "hypr/autostart.lua".source = ./luaconf/autostart.lua;
      "hypr/zawarudo.lua".text =
        # lua
        ''
          local SHADER = "${zawarudo_shader}"
          local zawarudo = "${lib.getExe pkgs.wl-freeze}"
          hl.bind("SUPER + W", function()
            local window = hl.get_active_window()
            if window == nil then return end
            local pid = window.pid

            hl.config({ decoration = { screen_shader = SHADER } })
            os.execute(zawarudo .. " -p " .. pid .. " -s &")
            hl.timer(function()
              hl.config({ decoration = { screen_shader = "" } })
              os.execute(zawarudo .. " -p " .. pid .. " -s &")
            end, { timeout = 9000, type = "oneshot" })
          end)
        '';
    };
  };
}
