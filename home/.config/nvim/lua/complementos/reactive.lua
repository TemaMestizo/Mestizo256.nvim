return {
	"rasulomaroff/reactive.nvim",
	lazy = false,
	config = function()
		require("reactive").add_preset(require("mestizo256").integraciones_especiales.reactive)
	end,
}
