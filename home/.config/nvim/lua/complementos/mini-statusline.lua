return {
	"nvim-mini/mini.statusline",
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-mini/mini-git",
		"nvim-mini/mini.diff",
	},
	version = false,
	config = function()
		require("mini.statusline").setup(require("mestizo256.integraciones_especiales.mini-statusline").obtener())
	end,
}
