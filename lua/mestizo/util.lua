local M = {}

---@param claves table<table<string, string>>
M.establecer_colores = function(claves)
	for _, integracion in ipairs(claves) do
		for clave, valor in pairs(integracion) do
			vim.api.nvim_set_hl(0, clave, valor)
		end
	end
end

return M
