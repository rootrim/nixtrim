local terminal = "kitty -1"
local launcher = "kitten quick-access-terminal fsel -d"
local clipboard = launcher .. " --cclip"
local screenshot = "hyprshot -m region -z"
local colorpicker = "hyprpicker | wl-copy"

local main_mod = "SUPER"
local sub_mod = "ALT"

hl.bind(main_mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd(launcher))
hl.bind(main_mod .. " + C", hl.dsp.exec_cmd(clipboard))
hl.bind(main_mod .. " + U", hl.dsp.exec_cmd(colorpicker))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ "fullscreen", "toggle" }))
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + BACKSPACE", hl.dsp.window.kill())
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("Print", hl.dsp.exec_cmd(screenshot))

hl.bind(sub_mod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	hl.bind("catchall", hl.dsp.submap("reset"))
end)

local hjkl = {
	left = "h",
	down = "j",
	up = "k",
	right = "l",
}

for direction, key in pairs(hjkl) do
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ direction = direction }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction, group_aware = true }))
end

hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(main_mod .. " + right", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(main_mod .. " + left", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(main_mod .. " + down", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
