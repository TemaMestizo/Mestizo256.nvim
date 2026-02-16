local util = require("mestizo256.util")
local integracion_escencial = require("mestizo256.integraciones.escencial")

return {
	["@property"] = { link = "Property" },
	["@variable.parameter"] = { ctermfg = 9 },
	["@function.call"] = { link = "Function" },
	["@function.method"] = { link = "Method" },
	["@function.method.call"] = { link = "Method" },
	["@string.escape"] = { ctermfg = 223, italic = true },

	["@variable.builtin.typescript"] = { link = "Builtin" },

	["@markup.heading.gitcommit"] = { ctermfg = 15 },
	["@markup.link"] = { ctermfg = 4, underline = true },
	["@markup.heading.markdown"] = { ctermfg = 15, bold = true },

	["@markup.heading.1.markdown"] = util.fusionar_tablas(integracion_escencial.Title, { ctermfg = 1 }),
	["@markup.heading.2.markdown"] = util.fusionar_tablas(integracion_escencial.Title, { ctermfg = 196 }),
	["@markup.heading.3.markdown"] = util.fusionar_tablas(integracion_escencial.Title, { ctermfg = 202 }),
	["@markup.heading.4.markdown"] = util.fusionar_tablas(integracion_escencial.Title, { ctermfg = 208 }),
	["@markup.heading.5.markdown"] = util.fusionar_tablas(integracion_escencial.Title, { ctermfg = 214 }),
	["@markup.heading.6.markdown"] = util.fusionar_tablas(integracion_escencial.Title, { ctermfg = 220 }),

	["@markup.quote.markdown"] = { ctermfg = 254 },
	["@markup.list.markdown"] = { ctermfg = 209 },
	["@markup.strikethrough"] = { ctermfg = 252, strikethrough = true },
	["@markup.raw.block.markdown"] = { ctermbg = 232 },
	["@punctuation.special.markdown"] = { ctermfg = 1 },
	["@markup.list.unchecked.markdown"] = { ctermfg = 154 },
	["@markup.list.checked.markdown"] = { ctermfg = 2 },
}
