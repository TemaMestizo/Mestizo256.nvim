local util = require("mestizo.util")
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
		table.insert(integraciones, require("mestizo.integraciones." .. nombre))
	end

	return integraciones
end

local claves = obtener_integraciones()

M.integraciones_especiales = {
	reactive = require("mestizo.integraciones_especiales.reactive"),
	bufferline = require("mestizo.integraciones_especiales.bufferline"),
	cmp = require("mestizo.integraciones_especiales.cmp"),
	tiny_inline_diagnostics = require("mestizo.integraciones_especiales.tiny-inline-diagnostics"),
	hlchunk = require("mestizo.integraciones_especiales.hlchunk"),
	noice = require("mestizo.integraciones_especiales.noice"),
	blink = require("mestizo.integraciones_especiales.blink"),
	mini_statusline = require("mestizo.integraciones_especiales.mini-statusline"),
	dashboard = require("mestizo.integraciones_especiales.dashboard"),
}

M.establecer = function()
	vim.cmd.hi("clear")
	vim.g.colors_name = "mestizo"
	vim.o.termguicolors = false

	util.establecer_colores(claves)
end

return M
