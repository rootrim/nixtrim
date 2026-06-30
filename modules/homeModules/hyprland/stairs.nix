{
  flake.homeModules.stairs = {pkgs, ...}: {
    xdg.configFile = let
      pretty_boy_v3 = ./stairsFiles/pretty_boy_v3.opus;
      aura_monster_subaru = ./stairsFiles/usbaru.gif;
    in {
      "hypr/stairs.lua".text =
        # lua
        ''
          local pwplay = "${pkgs.pipewire}/bin/pw-play"
          local mpvpaper = "${pkgs.mpvpaper}/bin/mpvpaper"

          local timer = nil
          local windows = {}
          local WIN_W, WIN_H = 120, 120
          local START_X, START_Y = 640, 1040

          local function get_workspace_windows()
          	local ws = hl.get_active_workspace()
          	if not ws then
          		return {}
          	end
          	local result = {}
          	for _, w in ipairs(hl.get_windows() or {}) do
          		if w.workspace and w.workspace.id == ws.id then
          			result[#result + 1] = w
          		end
          	end
          	return result
          end
          local function set_windows()
          	windows = get_workspace_windows()
          	for _, window in ipairs(windows) do
          		hl.dispatch(hl.dsp.window.float({ action = "on", window = window }))
          		hl.dispatch(hl.dsp.window.resize({
          			x = WIN_W,
          			y = WIN_H,
          			relative = false,
          			window = window,
          		}))
          	end
          end

          local function set_positions()
          	for index, window in ipairs(windows) do
          		hl.dispatch(hl.dsp.window.move({
          			x = START_X + WIN_W * (index - 1),
          			y = START_Y - (WIN_H / 2) * (index - 1),
          			relative = false,
          			window = window,
          		}))
          	end
          end

          local function rotate()
          	if #windows < 2 then
          		return
          	end
          	table.insert(windows, table.remove(windows, 1))
          	set_positions()
          end

          local function stop()
          	if timer == nil then
          		return
          	end
          	timer:set_enabled(false)
          	timer = nil
          	for _, window in ipairs(windows) do
          		hl.dispatch(hl.dsp.window.float({ action = "off", window = window }))
          	end
          end

          hl.bind("SUPER + M", function()
          	if timer then
          		stop()
          		hl.dispatch(hl.dsp.exec_raw("pkill mpvpaper"))
          		hl.dispatch(hl.dsp.exec_raw("pkill pw-play"))
          		return
          	end
          	set_windows()
          	set_positions()
          	hl.dispatch(hl.dsp.exec_raw(mpvpaper .. " -vs -o \"loop\" eDP-1 ${aura_monster_subaru}"))
          	hl.dispatch(hl.dsp.exec_raw(pwplay .. " ${pretty_boy_v3}"))
          	timer = hl.timer(function()
          		rotate()
          	end, { timeout = 500, type = "repeat" })
          end)
        '';
    };
  };
}
