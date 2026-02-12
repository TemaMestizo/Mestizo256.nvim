return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = { "nvim-mini/mini.icons", "saghen/blink.cmp" },
	config = function()
		require("markview").setup({
			preview = { icon_provider = "mini" },
		})
	end,
}
