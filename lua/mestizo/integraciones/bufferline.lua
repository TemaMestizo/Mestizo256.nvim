return {
	BufferLineBuffer = { ctermfg = 250, ctermbg = "NONE" },
	BufferLineBufferSelected = { link = "Title" },
	BufferLineBufferVisible = { ctermfg = 250, ctermbg = 234 },

	BufferLineCloseButtonSelected = { link = "BufferLineBufferSelected" },
	BufferLineCloseButtonVisible = { link = "BufferLineBufferVisible" },

	BufferLineDevIconDefaultSelected = { link = "BufferLineBufferSelected" },
	BufferLineDevIconDefaultVisible = { link = "BufferLineBufferVisible" },

	BufferLineSeparatorSelected = { link = "BufferLineBufferSelected" },
	BufferLineSeparatorVisible = { link = "BufferLineBufferVisible" },
	BufferLineSeparator = { ctermfg = 16 },

	BufferLineIndicatorSelected = { link = "BufferLineBufferSelected" },
	BufferLineIndicatorVisible = { link = "BufferLineBufferVisible" },
	BufferLineIndicator = { link = "BufferLineSeparator" },

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
