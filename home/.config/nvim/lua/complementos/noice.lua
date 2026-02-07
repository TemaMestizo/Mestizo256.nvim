return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = require("mestizo256").integraciones_especiales.noice({
		lsp = {
			signature = { enabled = true },
			hover = { enabled = true },
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
	}),
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
