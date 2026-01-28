---@param tope number|string
---@param base number|string
local function crear_claves(tope, base)
	return {
		CursorLine = { ctermbg = base },
		CursorLineNr = { ctermfg = tope, ctermbg = base, bold = true },
		CursorLineSign = { ctermbg = base },
	}
end

return {
	name = "mestizo",
	init = function()
		vim.opt.cursorline = true
	end,
	static = {
		winhl = {
			inactive = crear_claves(248, "NONE"),
		},
	},
	modes = {
		i = { winhl = crear_claves(6, 17) },
		n = { winhl = crear_claves(4, 17) },

		[{ "v", "V", "\x16" }] = {
			winhl = crear_claves(5, 53),
		},

		R = { winhl = crear_claves(2, 22) },

		no = {
			operators = {
				[{ "gu", "gU", "g~", "~" }] = {
					winhl = crear_claves(2, 22),
				},
				[{ "c", "d" }] = { winhl = crear_claves(1, 52) },
				y = { winhl = crear_claves(3, 58) },
			},
		},
	},
}
