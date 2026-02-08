local M = {}

M.obtener = require("mestizo256.util").crear_tabla_sobreescribible({
	lsp = {
		hover = {
			enabled = true,
			opts = { border = { style = "rounded", highlight = "FloatBorder" } },
		},
		signature = {
			enabled = true,
			opts = { border = { style = "rounded", highlight = "FloatBorder" } },
		},
	},
})

return M
