{
  flake.homeModules.zawarudo = {
    pkgs,
    lib,
    ...
  }: {
    xdg.configFile = let
      zawarudo_shader = ./zawarudoFiles/zawarudo.frag;
      zawarudo_opus = ./zawarudoFiles/zawarudo.opus;
      tokiwaumekides_opus = ./zawarudoFiles/tokiwaumekides.opus;
    in {
      "hypr/zawarudo.lua".text =
        # lua
        ''
          local SHADER = "${zawarudo_shader}"
          local zawarudo = "${lib.getExe pkgs.wl-freeze}"
          local pwplay = "${pkgs.pipewire}/bin/pw-play"
          local active = false

          local function reboot_monitor()
            hl.timer(function()
              hl.dispatch(hl.dsp.dpms({ action = "disable" }))
              hl.timer(function()
                hl.dispatch(hl.dsp.dpms({ action = "enable" }))
              end, { timeout = 10, type = "oneshot" })
            end, { timeout = 5, type = "oneshot" })
          end

          hl.bind("SUPER + W", function()
            if active then return end

            local window = hl.get_active_window()
            if window == nil then return end

            local pid = window.pid
            active = true

            hl.config({ decoration = { screen_shader = SHADER } })
            hl.dispatch(hl.dsp.exec_raw(zawarudo .. " -p " .. pid .. " -s &"))
            hl.dispatch(hl.dsp.exec_raw(pwplay .. " ${zawarudo_opus} &"))

            reboot_monitor()

            hl.timer(function()
              hl.config({ decoration = { screen_shader = "" } })
              reboot_monitor()
              hl.dispatch(hl.dsp.exec_raw(zawarudo .. " -p " .. pid .. " -s"))
              hl.dispatch(hl.dsp.exec_raw(pwplay .. " ${tokiwaumekides_opus}"))
              active = false
            end, { timeout = 9000, type = "oneshot" })
          end)
        '';
    };
  };
}
