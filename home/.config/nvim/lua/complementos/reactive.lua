return {
	"rasulomaroff/reactive.nvim",
	lazy = false,
	config = function()
		require("reactive").setup({
			load = "mestizo256",
		})
	end,
}
