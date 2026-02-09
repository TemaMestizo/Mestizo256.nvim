local M = {}

local function asignar_color_de_icono()
	local integracion_bufferline = require("mestizo256.integraciones.bufferline")
	local util = require("mestizo256.util")

	local ok, WebDevicons = pcall(require, "nvim-web-devicons")
	if not ok then
		return
	end

	local extension = vim.fn.expand("%:e")
	local icono = WebDevicons.get_icons_by_extension()[extension]

	if not icono then
		return
	end

	local claves = {
		["BufferLineDevIcon" .. icono.name .. "Selected"] = util.fusionar_tablas(
			integracion_bufferline.BufferLineBufferSelected,
			{ ctermfg = tonumber(icono.cterm_color) }
		),
		["BufferLineDevIcon" .. icono.name .. "Inactive"] = util.fusionar_tablas(
			integracion_bufferline.BufferLineBufferSelected,
			{ ctermfg = tonumber(icono.cterm_color) }
		),
		["BufferLineDevIcon" .. icono.name] = util.fusionar_tablas(
			integracion_bufferline.BufferLineFill,
			{ ctermfg = tonumber(icono.cterm_color) }
		),
	}

	require("mestizo256.util").establecer_colores({ claves })
end

M.obtener = function()
	vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWinEnter", "BufRead" }, {
		pattern = "*",
		callback = function()
			asignar_color_de_icono()
		end,
	})
end

return M
