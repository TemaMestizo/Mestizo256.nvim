return {
	"nvim-mini/mini.statusline",
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-mini/mini-git",
		"nvim-mini/mini.diff",
	},
	version = false,
	config = function()
		local MiniStatusline = require("mini.statusline")

		MiniStatusline.setup({
			use_icons = true,
			content = {
				active = function()
					return MiniStatusline.combine_groups(
						require("mestizo256.integraciones_especiales.mini-statusline").obtener()
					)
				end,
			},
		})
	end,
}
