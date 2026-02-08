local M = {}

M.obtener = require("mestizo256.util").crear_tabla_sobreescribible({
	chunk = {
    enable = true,
		style = {
			{ ctermfg = 90 },
			{ ctermfg = 1 },
		},
	},
})

return M
