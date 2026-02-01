return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				show_source = { enabled = true },
				add_messages = { display_count = true },
				multilines = { enabled = true },
			},
		})

		vim.diagnostic.config({ virtual_text = false })

		require("mestizo").integraciones_especiales.tiny_inline_diagnostics()
	end,
}
