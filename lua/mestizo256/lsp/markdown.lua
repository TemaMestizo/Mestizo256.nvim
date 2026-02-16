local util = require("mestizo256.util")
local integracion_escencial = require("mestizo256.integraciones.escencial")

local titulo = util.fusionar_tablas(integracion_escencial.Title, { ctermbg = 236 })

return {
	["@markup.heading.gitcommit"] = { ctermfg = 15 },
	["@markup.link"] = { ctermfg = 4, underline = true },
	["@markup.heading.markdown"] = { ctermfg = 15, bold = true },

	markdownH1 = { link = "@markup.heading.1.markdown" },
	markdownH2 = { link = "@markup.heading.2.markdown" },
	markdownH3 = { link = "@markup.heading.3.markdown" },
	markdownH4 = { link = "@markup.heading.4.markdown" },
	markdownH5 = { link = "@markup.heading.5.markdown" },
	markdownH6 = { link = "@markup.heading.6.markdown" },
	markdownH1Delimiter = { link = "markdownH1" },
	markdownH2Delimiter = { link = "markdownH2" },
	markdownH3Delimiter = { link = "markdownH3" },
	markdownH4Delimiter = { link = "markdownH4" },
	markdownH5Delimiter = { link = "markdownH5" },
	markdownH6Delimiter = { link = "markdownH6" },

	["@markup.heading.1.markdown"] = util.fusionar_tablas(titulo, { ctermfg = 1 }),
	["@markup.heading.2.markdown"] = util.fusionar_tablas(titulo, { ctermfg = 196 }),
	["@markup.heading.3.markdown"] = util.fusionar_tablas(titulo, { ctermfg = 202 }),
	["@markup.heading.4.markdown"] = util.fusionar_tablas(titulo, { ctermfg = 208 }),
	["@markup.heading.5.markdown"] = util.fusionar_tablas(titulo, { ctermfg = 214 }),
	["@markup.heading.6.markdown"] = util.fusionar_tablas(titulo, { ctermfg = 220 }),

	["@markup.quote.markdown"] = { ctermfg = 254 },
	["@markup.list.markdown"] = { ctermfg = 209 },
	["@markup.strikethrough"] = { ctermfg = 252, strikethrough = true },
	["@markup.raw.block.markdown"] = { ctermbg = 232 },
	["@punctuation.special.markdown"] = { ctermfg = 1 },
	["@markup.list.unchecked.markdown"] = { ctermfg = 154 },
	["@markup.list.checked.markdown"] = { ctermfg = 2 },

	markdownListMarker = { link = "@markup.list.markdown" },
	markdownUrl = { link = "Function" },
}
