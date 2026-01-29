-- Código tomado de algun lugar de: https://github.com/loctvl842/monokai-pro.nvim

return function()
	local function asignar_color_de_icono()
		local ok, WebDevicons = pcall(require, "nvim-web-devicons")
		if not ok then
			return
		end

		local nombre_de_archivo = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local _, nombre_del_icono = WebDevicons.get_icon(nombre_de_archivo, extension, { default = true })

		if not nombre_del_icono then
			return
		end

		local claves = {
			["BufferLine" .. nombre_del_icono .. "Selected"] = {
				link = "BufferLineBufferSelected",
			},
			["BufferLine" .. nombre_del_icono] = {
				link = "BufferLineBuffer",
			},
			["BufferLine" .. nombre_del_icono .. "Inactive"] = {
				link = "BufferLineBufferVisible",
			},
		}

		require("mestizo.util").establecer_colores({ claves })
	end

	vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWinEnter", "BufRead" }, {
		pattern = "*",
		callback = function()
			if vim.g.colors_name ~= "mestizo" then
				return true
			end
			asignar_color_de_icono()
		end,
	})
end
