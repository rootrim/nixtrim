hl.config({
	general = {
		gaps_in = 10,
		gaps_out = { top = 40, left = 40, right = 5, bottom = 40 },
		border_size = 5,

		resize_on_border = false,
		allow_tearing = true,
	},

	decoration = {
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(0,0,0,0.6)",
			offset = { 4, 4 },
			scale = 1.0,
		},

		glow = { enabled = false },

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			ignore_opacity = true,
		},
	},
})
