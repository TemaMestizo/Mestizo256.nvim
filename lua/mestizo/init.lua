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
	}

	for _, nombre in ipairs(nombres_de_integraciones) do
		table.insert(integraciones, require("mestizo.integraciones." .. nombre))
	end

	return integraciones
end

local claves = obtener_integraciones()

---@param claves table<table<string, string>>
local function establecer_colores(claves)
	for _, integracion in ipairs(claves) do
		for clave, valor in pairs(integracion) do
			vim.api.nvim_set_hl(0, clave, valor)
		end
	end
end

M.integraciones_especiales = {
	reactive = require("mestizo.integraciones_especiales.reactive"),
}

M.establecer = function()
	vim.cmd.hi("clear")
	vim.g.colors_name = "mestizo"
	vim.o.termguicolors = false

	establecer_colores(claves)
end

return M
