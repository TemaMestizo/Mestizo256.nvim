-- TAREA: Arreglare el CursorLine

local niveles = {
	Error = { fg = 1, bg = 52 },
	Warn = { fg = 3, bg = 58 },
	Info = { fg = 2, bg = 22 },
	Hint = { fg = 6, bg = 23 },
}

local claves = {
	TinyInlineDiagnosticVirtualTextArrow = { link = "CursorLine" },
	TinyInlineDiagnosticVirtualTextArrowNoBg = { link = "Comment" },
}

for clave_a, valor_a in pairs(niveles) do
	claves["TinyInlineDiagnosticVirtualText" .. clave_a] = { ctermfg = valor_a.fg, ctermbg = valor_a.bg }
	claves["TinyInlineDiagnosticVirtualText" .. clave_a .. "NoBg"] = { ctermfg = valor_a.fg }

	claves["TinyInlineInvDiagnosticVirtualText" .. clave_a] = { ctermfg = valor_a.bg }

	claves["TinyInlineInvDiagnosticVirtualText" .. clave_a .. "NoBg"] = { ctermfg = valor_a.bg }

	for clave_b, valor_b in pairs(niveles) do
		claves["TinyInlineDiagnosticVirtualText" .. clave_a .. "Mix" .. clave_b] = {
			ctermfg = valor_a.fg,
			ctermbg = valor_b.bg,
		}
	end
end

return function()
	vim.api.nvim_create_autocmd({ "LspAttach" }, {
		pattern = "*",
		callback = function()
			if vim.g.colors_name ~= "mestizo" then
				return true
			end
			require("mestizo.util").establecer_colores({ claves })
		end,
	})
end
