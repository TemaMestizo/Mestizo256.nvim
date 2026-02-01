local M = {}

function M.obtener_modulo_de_cwd()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	local icono_de_cwd, _, _ = require("mini.icons").get("directory", cwd)
	local git = require("mini.statusline").section_git({})

	return {
		hl = "MiniStatuslineCwd",
		strings = { icono_de_cwd, cwd, git ~= "" and ">" or "", git },
	}
end

function M.obtener_modulo_de_palabras()
	local conteo_de_palabras = vim.fn.wordcount()
	local palabra_bajo_el_cursor = tostring(conteo_de_palabras.cursor_words)
	local total_de_palabras = tostring(conteo_de_palabras.words)

	return {
		hl = "MiniStatuslineWords",
		strings = { "Palabra", palabra_bajo_el_cursor, "de", total_de_palabras },
	}
end

function M.obtener_modulo_de_tipo_de_archivo()
	local tipo_de_archivo = string.upper(vim.bo.filetype)
	local icono_de_archivo, _, _ = require("mini.icons").get("filetype", tipo_de_archivo)

	return { hl = "MiniStatuslineInfoFile", strings = { icono_de_archivo, tipo_de_archivo } }
end

function M.obtener_modulo_de_busqueda()
	local cuenta = require("mini.statusline").section_searchcount({})
	local texto = cuenta == "" and "" or "Búsqueda: " .. cuenta

	return { hl = "MiniStatuslineSearch", strings = { texto } }
end

function M.obtener_modulo_de_git_diff()
	local estado_de_git = (function()
		local gitsigns_status = vim.b.gitsigns_status_dict or {}
		local minidiff_status = vim.b.minidiff_summary or {}

		return {
			agregado = gitsigns_status.added or minidiff_status.add or 0,
			modificado = gitsigns_status.changed or minidiff_status.change or 0,
			eliminado = gitsigns_status.removed or minidiff_status.delete or 0,
		}
	end)()

	local git_agregado = estado_de_git.agregado > 0 and "+" .. tostring(estado_de_git.agregado) or nil
	local git_modificado = estado_de_git.modificado > 0 and "~" .. tostring(estado_de_git.modificado) or nil
	local git_eliminado = estado_de_git.eliminado > 0 and "~" .. tostring(estado_de_git.eliminado) or nil

	return { hl = "MiniStatuslineDiffAdded", strings = { git_agregado } }, {
		hl = "MiniStatuslineDiffModified",
		strings = { git_modificado },
	}, { hl = "MiniStatuslineDiffDeleted", strings = { git_eliminado } }
end

function M.obtener_modulo_de_lsps()
	local mensaje = {}
	local lsps_activos = vim.lsp.get_clients({ bufnr = 0 })

	if #lsps_activos > 0 then
		table.insert(mensaje, " ")

		for _, cliente in ipairs(lsps_activos) do
			if cliente.name == "" then
				goto continue
			end

			table.insert(mensaje, " ")
			table.insert(mensaje, cliente.name)

			::continue::
		end
	end

	return { hl = "MiniStatuslineActiveLsps", strings = { table.concat(mensaje) } }
end

function M.obtener_modulo_de_locacion()
	local linea = tostring(vim.fn.line("."))
	local columna = tostring(vim.fn.col("."))

	return { hl = "MiniStatuslineLocation", strings = { linea .. ":" .. columna } }
end

M.espaciador = { hl = "MiniStatuslinePadding", strings = { "%=" } }

function M.obtener_todo_el_conjunto()
	local cwd = M.obtener_modulo_de_cwd()
	local diff_agregado, diff_modificado, diff_eliminado = M.obtener_modulo_de_git_diff()
	local palabras = M.obtener_modulo_de_palabras()
	local busqueda = M.obtener_modulo_de_busqueda()
	local lsps = M.obtener_modulo_de_lsps()
	local tipo_de_archivo = M.obtener_modulo_de_tipo_de_archivo()
	local locacion = M.obtener_modulo_de_locacion()

	return {
		cwd,
		diff_agregado,
		diff_modificado,
		diff_eliminado,
		M.espaciador,
		palabras,
		busqueda,
		lsps,
		tipo_de_archivo,
		locacion,
	}
end

return M
