local util = require("mestizo256.util")
local integracion_escencial = require("mestizo256.integraciones.escencial")

local buffer_activo = integracion_escencial.Normal
local buffer_inactivo = { ctermfg = integracion_escencial.Comment.ctermfg, ctermbg = 16 }

---@return table<string, table>
local function crear_claves_de_mini_icons()
	local ok, _ = pcall(require, "mini.icons")
	if not ok then
		return {}
	end

	local claves = {}
	local integracion_mini_icons = require("mestizo256.integraciones.mini-icons")

	for clave, valor in pairs(integracion_mini_icons) do
		claves["BufferLine" .. clave .. "Selected"] = util.fusionar_tablas(buffer_activo, valor)
		claves["BufferLine" .. clave .. "Inactive"] = util.fusionar_tablas(buffer_activo, valor)
		claves["BufferLine" .. clave] = buffer_inactivo
	end

	return claves
end

local claves = {
	BufferLineFill = buffer_inactivo,

	BufferLineBackground = { link = "BufferLineFill" },

	BufferLineBuffer = { link = "BufferLineFill" },
	BufferLineBufferSelected = buffer_activo,
	BufferLineBufferVisible = { link = "BufferLineBufferSelected" },

	BufferLineDuplicate = util.fusionar_tablas(buffer_inactivo, { italic = true }),
	BufferLineDuplicateVisible = util.fusionar_tablas(buffer_inactivo, { italic = true }),
	BufferLineDuplicateSelected = util.fusionar_tablas(buffer_activo, integracion_escencial.Comment),

	BufferLineCloseButton = { link = "BufferLineBuffer" },
	BufferLineCloseButtonSelected = { link = "BufferLineBufferSelected" },
	BufferLineCloseButtonVisible = { link = "BufferLineBufferVisible" },

	BufferLineDevIconDefaultSelected = { link = "BufferLineBufferSelected" },
	BufferLineDevIconDefaultInactive = { link = "BufferLineBufferVisible" },

	BufferLineSeparator = { ctermfg = 16, ctermbg = 16 },
	BufferLineSeparatorSelected = { ctermfg = 16, ctermbg = integracion_escencial.Normal.ctermbg },
	BufferLineSeparatorVisible = { link = "BufferLineSeparatorSelected" },

	BufferLineIndicator = { ctermfg = 16, ctermbg = 16 },
	BufferLineIndicatorSelected = { ctermfg = 233, ctermbg = 233 },
	BufferLineIndicatorVisible = { link = "BufferLineIndicatorSelected" },

	BufferLineModifiedSelected = { link = "BufferLineBufferSelected" },
	BufferLineModifiedVisible = { link = "BufferLineBufferVisible" },
	BufferLineModified = { link = "BufferLineBuffer" },

	BufferLineNumbersSelected = { link = "BufferLineBufferSelected" },
	BufferLineNumbersVisible = { link = "BufferLineBufferVisible" },
	BufferLineNumbers = { link = "BufferLineBuffer" },

	BufferLinePickSelected = { ctermfg = 209, ctermbg = 1 },
	BufferLinePickVisible = { ctermfg = 6 },
	BufferLinePick = { link = "BufferLinePickVisible" },

	BufferLineTab = { link = "BufferLineBuffer" },
	BufferLineTabSelected = { link = "BufferLineBufferSelected" },

	BufferLineTabSeparator = { link = "BufferLineSeparator" },
	BufferLineTabSeparatorSelected = util.fusionar_tablas(buffer_activo, { ctermfg = buffer_inactivo.ctermbg }),

	BufferLineTabClose = util.fusionar_tablas(buffer_inactivo, { ctermfg = 1 }),

	BufferLineOffsetSeparator = { link = "FloatBorder" },
}

return util.fusionar_tablas(claves, crear_claves_de_mini_icons())
