local util = require("mestizo256.util")
local M = {}

---@return table<table<string, string>>
local function obtener_integraciones()
	local integraciones = {}
	local nombres_de_integraciones = {
		"escencial",
		"lsp",
		"neotree",
		"fyler",
		"gitsigns",
		"telescope",
		"rainbow-delimiters",
		"which-key",
		"bufferline",
		"cmp",
		"blink",
		"noice",
		"mini-statusline",
		"dashboard",
	}

	for _, nombre in ipairs(nombres_de_integraciones) do
		table.insert(integraciones, require("mestizo256.integraciones." .. nombre))
	end

	return integraciones
end

local claves = obtener_integraciones()

M.establecer = function()
	vim.cmd.hi("clear")
	vim.g.colors_name = "mestizo256"
	vim.o.termguicolors = false

	util.establecer_colores(claves)
end

return M
