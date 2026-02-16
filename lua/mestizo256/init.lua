local util = require("mestizo256.util")
local M = {}

local claves = {}

local function obtener_integraciones()
	local rutas = {
		"escencial",
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
		"mini-icons",
		"markview",
	}

	for _, ruta in ipairs(rutas) do
		table.insert(claves, require("mestizo256.integraciones." .. ruta))
	end
end

local function obtener_claves_de_lsp()
	local rutas = {
		"general",
		"markdown",
	}

	for _, ruta in ipairs(rutas) do
		table.insert(claves, require("mestizo256.lsp." .. ruta))
	end
end

M.establecer = function()
	vim.cmd.hi("clear")
	vim.g.colors_name = "mestizo256"
	vim.o.termguicolors = false

	obtener_integraciones()
	obtener_claves_de_lsp()

	util.establecer_colores(claves)
end

return M
