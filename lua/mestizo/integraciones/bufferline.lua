local integracion_escencial = require("mestizo.integraciones.escencial")

return {
	BufferLineFill = { ctermbg = 16, nocombine = true },

	BufferLineBuffer = { link = "BufferLineFill" },
	BufferLineBackground = { link = "BufferLineFill" },
	BufferLineBufferSelected = integracion_escencial.Normal,
	BufferLineBufferVisible = { link = "BufferLineBufferSelected" },

	BufferLineCloseButton = { link = "BufferLineBuffer" },
	BufferLineCloseButtonSelected = { link = "BufferLineBufferSelected" },
	BufferLineCloseButtonVisible = { link = "BufferLineBufferVisible" },

	BufferLineDevIconDefaultSelected = { link = "BufferLineBufferSelected" },
	BufferLineDevIconDefaultInactive = { link = "BufferLineBufferVisible" },

	BufferLineSeparator = { ctermfg = 16, ctermbg = 16 },
	BufferLineSeparatorSelected = { ctermfg = 16, ctermbg = 233 },
	BufferLineSeparatorVisible = { link = "BufferLineSeparatorSelected" },

	BufferLineIndicator = { ctermfg = 16, ctermbg = 16 },
	BufferLineIndicatorSelected = { ctermfg = 233, ctermbg = 233 },
	BufferLineIndicatorVisible = { link = "BufferLineIndicatorSelected" },

	BufferLineModifiedSelected = { link = "BufferLineBufferSelected" },
	BufferLineModifiedVisible = { link = "BufferLineBufferVisible" },
	BufferLineModified = { link = "BufferLineBuffer" },

	BufferLineNumbersSelected = { link = "BufferLineBufferSelected" },
	BufferLineNumbersVisible = { link = "BufferLineBufferVisible" },
	BufferLineNumbers = { link = "BufferLineBuffer" },

	BufferLinePickSelected = { ctermfg = 209, ctermbg = 1 },
	BufferLinePickVisible = { ctermfg = 6 },
	BufferLinePick = { link = "BufferLinePickVisible" },

	BufferLineTab = { link = "BufferLineBuffer" },
	BufferLineTabSelected = { ctermfg = 0, ctermbg = 6 },

	BufferLineTabSeparator = { link = "BufferLineSeparator" },
	BufferLineTabSeparatorSelected = { link = "BufferLineTabSelected" },

	BufferLineTabClose = { link = "BufferLineTabSelected" },

	BufferLineOffsetSeparator = { link = "FloatBorder" },
}
