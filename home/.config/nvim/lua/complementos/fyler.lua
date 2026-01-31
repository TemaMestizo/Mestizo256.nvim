return {
  enabled = false,
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-mini/mini.icons", config = true },
	branch = "stable",
	lazy = false,
	opts = {},
	keys = {
		{
			"<C-n>",
			function()
				require("fyler").toggle({ kind = "split_left" })
			end,
		},
	},
}
