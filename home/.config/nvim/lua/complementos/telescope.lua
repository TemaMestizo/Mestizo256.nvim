return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<space>ff",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		{
			"<space>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
		},
		{
			"<space>fb",
			function()
				require("telescope.builtin").buffers()
			end,
		},
	},
}
