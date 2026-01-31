local M = {}

---@param claves table<table<string, string>>
M.establecer_colores = function(claves)
	for _, integracion in ipairs(claves) do
		for clave, valor in pairs(integracion) do
			vim.api.nvim_set_hl(0, clave, valor)
		end
	end
end

---@generic T, K
---@param lista T[]
---@param fn fun(valor: T): K
---@return K[]
M.map = function(lista, fn)
	local nueva_lista = {}

	for _, valor in ipairs(lista) do
		table.insert(nueva_lista, fn(valor))
	end

	return nueva_lista
end

return M
