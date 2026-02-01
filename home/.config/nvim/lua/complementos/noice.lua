return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = require("mestizo").integraciones_especiales.noice({
		lsp = { signature = { enabled = true }, hover = { enabled = true } },
	}),
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
