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

---@param tabla_a table
---@param tabla_b table
---@return table
M.fusionar_tablas = function(tabla_a, tabla_b)
	local resultado = {}

	for clave, valor in pairs(tabla_a) do
		if type(valor) == "table" then
			resultado[clave] = M.fusionar_tablas(valor, {})
		else
			resultado[clave] = valor
		end
	end

	for clave, valor in pairs(tabla_b) do
		if type(valor) == "table" and type(resultado[clave]) == "table" then
			resultado[clave] = M.fusionar_tablas(resultado[clave], valor)
		else
			resultado[clave] = valor
		end
	end

	return resultado
end

---@param tabla table
---@return fun(nueva_tabla?: table): table
M.crear_tabla_sobreescribible = function(tabla)
	---@param nueva_tabla? table
	return function(nueva_tabla)
		if nueva_tabla == nil then
			return tabla
		end

		return M.fusionar_tablas(tabla, nueva_tabla)
	end
end

---@generic T
---@param fn fun(): T
---@return T
M.anonima = function(fn)
	return fn()
end

---@generic T,K
---@param valor_dado T
---@param tabla table<K, T>
---@return K|nil
M.obtener_clave_por_valor = function(valor_dado, tabla)
	for clave, valor in pairs(tabla) do
		if valor == valor_dado then
			return clave
		end
	end
end

return M
