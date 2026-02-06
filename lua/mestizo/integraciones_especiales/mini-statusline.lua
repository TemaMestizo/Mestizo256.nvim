local util = require("mestizo.util")

---@class MiniStatusline.Seccion
---@field hl string
---@field strings string[]

local M = {}

---@return MiniStatusline.Seccion
function M.crear_modulo_de_cwd()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	local icono_de_cwd, _, _ = require("mini.icons").get("directory", cwd)
	local git = require("mini.statusline").section_git({})

	return {
		hl = "MiniStatuslineCwd",
		strings = { icono_de_cwd, cwd, git ~= "" and ">" or "", git },
	}
end

---@return MiniStatusline.Seccion
function M.crear_modulo_de_palabras()
	local conteo_de_palabras = vim.fn.wordcount()
	local palabra_bajo_el_cursor = tostring(conteo_de_palabras.cursor_words)
	local total_de_palabras = tostring(conteo_de_palabras.words)

	return {
		hl = "MiniStatuslineWords",
		strings = { "Palabra", palabra_bajo_el_cursor, "de", total_de_palabras },
	}
end

---@return MiniStatusline.Seccion
function M.crear_modulo_de_tipo_de_archivo()
	local tipo_de_archivo = string.upper(vim.bo.filetype)
	local icono_de_archivo, _, _ = require("mini.icons").get("filetype", tipo_de_archivo)

	return { hl = "MiniStatuslineInfoFile", strings = { icono_de_archivo, tipo_de_archivo } }
end

---@return MiniStatusline.Seccion
function M.crear_modulo_de_busqueda()
	local cuenta = require("mini.statusline").section_searchcount({})
	local texto = cuenta == "" and "" or "Búsqueda: " .. cuenta

	return { hl = "MiniStatuslineSearch", strings = { texto } }
end

---@return MiniStatusline.Seccion, MiniStatusline.Seccion, MiniStatusline.Seccion
function M.crear_modulo_de_git_diff()
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

---@return MiniStatusline.Seccion
function M.crear_modulo_de_lsps()
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

---@return MiniStatusline.Seccion
function M.crear_modulo_de_locacion()
	local linea = tostring(vim.fn.line("."))
	local columna = tostring(vim.fn.col("."))

	return { hl = "MiniStatuslineLocation", strings = { linea .. ":" .. columna } }
end

---@enum NivelesDeDiagnosticos
local niveles_de_diagnosticos = {
	Error = 1,
	Warn = 2,
	Info = 3,
	Hint = 4,
}

---@type table<NivelesDeDiagnosticos, string>
local iconos_de_diagnosticos_basicos = {
	"E",
	"W",
	"I",
	"H",
}

---@param nombre string
---@return vim.fn.sign_getdefined.ret.item|nil
local function obtener_icono_de_neovim(nombre)
	local coincidencias = vim.fn.sign_getdefined(nombre)
	if #coincidencias < 1 then
		return
	end

	return coincidencias[1]
end

---@return MiniStatusline.Seccion,MiniStatusline.Seccion,MiniStatusline.Seccion,MiniStatusline.Seccion
function M.crear_modulo_de_diagnosticos()
	local id_del_buffer = vim.api.nvim_get_current_buf()
	local diagnosticos = vim.diagnostic.count(id_del_buffer)

	---@type table<NivelesDeDiagnosticos, number>
	local cuenta = { 0, 0, 0, 0 }

	---@param nivel NivelesDeDiagnosticos
	---@param cantidad number
	for nivel, cantidad in pairs(diagnosticos) do
		cuenta[nivel] = cantidad
	end

	---@param nivel NivelesDeDiagnosticos
	---@return MiniStatusline.Seccion
	local function crear_seccion_de_diagnostico(nivel)
		local clave = util.obtener_clave_por_valor(nivel, niveles_de_diagnosticos) or ""
		local icono = obtener_icono_de_neovim("DiagnosticSign" .. clave).text or iconos_de_diagnosticos_basicos[nivel]
		return {
			hl = "MiniStatuslineDiagnostic" .. clave,
			strings = {
				cuenta[nivel] > 0 and icono .. tostring(cuenta[nivel]) or "",
			},
		}
	end

	return crear_seccion_de_diagnostico(niveles_de_diagnosticos.Error),
		crear_seccion_de_diagnostico(niveles_de_diagnosticos.Warn),
		crear_seccion_de_diagnostico(niveles_de_diagnosticos.Info),
		crear_seccion_de_diagnostico(niveles_de_diagnosticos.Hint)
end

M.espaciador = { hl = "MiniStatuslinePadding", strings = { "%=" } }

function M.obtener_todo_el_conjunto()
	local cwd = M.crear_modulo_de_cwd()
	local diff_agregado, diff_modificado, diff_eliminado = M.crear_modulo_de_git_diff()
	local palabras = M.crear_modulo_de_palabras()
	local busqueda = M.crear_modulo_de_busqueda()
	local lsps = M.crear_modulo_de_lsps()
	local tipo_de_archivo = M.crear_modulo_de_tipo_de_archivo()
	local locacion = M.crear_modulo_de_locacion()
	local diagnostico_error, diagnostico_advertencia, diagnostico_info, diagnostico_pista =
		M.crear_modulo_de_diagnosticos()

	return {
		cwd,
		diff_agregado,
		diff_modificado,
		diff_eliminado,
		M.espaciador,
		diagnostico_error,
		diagnostico_advertencia,
		diagnostico_info,
		diagnostico_pista,
		M.espaciador,
		palabras,
		busqueda,
		lsps,
		tipo_de_archivo,
		locacion,
	}
end

return M
