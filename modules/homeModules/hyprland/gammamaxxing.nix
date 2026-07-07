{
  flake.homeModules.gammamaxxing = {
    xdg.configFile = let
      gamma_shader = ./gammamaxxing.frag;
    in {
      "hypr/gammamaxxing.lua".text =
        # lua
        ''
          local SHADER = "${gamma_shader}"
          local active = false

          local function reboot_monitor()
            hl.timer(function()
              hl.dispatch(hl.dsp.dpms({ action = "disable" }))
              hl.timer(function()
                hl.dispatch(hl.dsp.dpms({ action = "enable" }))
              end, { timeout = 10, type = "oneshot" })
            end, { timeout = 5, type = "oneshot" })
          end

          hl.bind("SUPER + N", function()
            if active then
              hl.config({ decoration = { screen_shader = "" } })
              reboot_monitor()
              return
            end

            active = true

            hl.config({ decoration = { screen_shader = SHADER } })
            reboot_monitor()
          end)
        '';
    };
  };
}
