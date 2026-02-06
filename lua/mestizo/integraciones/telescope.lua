local integracion_escencial = require("mestizo.integraciones.escencial")
local util = require("mestizo.util")

local fondo_de_entrada, fondo_de_resultados, fondo_de_previsualizacion = 234, 235, 236

return {
	TelescopeSelection = util.fusionar_tablas(integracion_escencial.Normal, { ctermbg = fondo_de_resultados + 2 }),
	TelescopeMatching = { link = "Search" },
	TelescopeMultiSelection = { link = "Visual" },

	TelescopeTitle = { link = "Title" },

	TelescopeBorder = { ctermfg = fondo_de_resultados, ctermbg = fondo_de_resultados },
	TelescopeNormal = { ctermbg = fondo_de_resultados },
	TelescopeResultsNormal = util.fusionar_tablas(integracion_escencial.File, { ctermbg = fondo_de_resultados }),

	TelescopePromptBorder = { ctermfg = fondo_de_entrada, ctermbg = fondo_de_entrada },
	TelescopePromptNormal = { ctermbg = fondo_de_entrada },
	TelescopePromptTitle = util.fusionar_tablas(integracion_escencial.Title, { ctermbg = 4 }),

	TelescopePreviewBorder = { ctermfg = fondo_de_previsualizacion, ctermbg = fondo_de_previsualizacion },
	TelescopePreviewNormal = { ctermbg = fondo_de_previsualizacion },
	TelescopePreviewTitle = util.fusionar_tablas(integracion_escencial.Title, { ctermbg = 5 }),
}
