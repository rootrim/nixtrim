hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@120",
	position = "0x0",
	scale = 1,
	-- vrr = 1,
})

hl.config({
	general = {
		layout = "scrolling",
	},

	input = {
		kb_layout = "tr",
		kb_options = "caps:swapescape",
		repeat_rate = 35,
		repeat_delay = 200,
		follow_mouse = 1,
		sensitivity = 0,
		natural_scroll = false,
	},

	misc = {
		vrr = 3,
	},

	xwayland = {
		enabled = true,
	},

	render = {
		direct_scanout = 2,
		cm_enabled = true,
	},

	quirks = {
		prefer_hdr = 1,
	},
})
