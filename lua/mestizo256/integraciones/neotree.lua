local integracion_escencial = require("mestizo256.integraciones.escencial")

return {
	NeoTreeCursorLine = { ctermbg = 234 },
	NeoTreeNormal = { ctermbg = 16 },
	NeoTreeNormalNC = { link = "NeoTreeNormal" },
	NeoTreeWinSeparator = {
		ctermfg = integracion_escencial.Normal.ctermbg,
		ctermbg = integracion_escencial.Normal.ctermbg,
	},

	NeoTreeDirectoryIcon = { link = "Directory" },
	NeoTreeDirectoryName = { link = "Directory" },
	NeoTreeRootName = { ctermfg = 254 },
	NeoTreeFileName = { link = "File" },
	NeoTreeDotFile = { link = "DotFile" },
	NeoTreeIndentMarker = { link = "IndentMarker" },
	NeoTreeDimText = { link = "Comment" },
	NeoTreeMessage = { link = "Comment" },

	NeoTreeGitAdded = { link = "Added" },
	NeoTreeGitUntracked = { link = "Untracked" },
	NeoTreeGitStaged = { link = "Staged" },
	NeoTreeGitModified = { link = "Modified" },
	NeoTreeGitUnstaged = { link = "Unstaged" },
	NeoTreeGitDeleted = { link = "Deleted" },
	NeoTreeGitIgnored = { link = "Ignored" },

	NeoTreeFloatNormal = { link = "Popup" },
	NeoTreeFloatBorder = { link = "PopupBorder" },
	NeoTreeFloatTitle = { ctermfg = 0, ctermbg = 208 },
	NeoTreeTitleBar = { link = "NeoTreeFloatTitle" },
}
