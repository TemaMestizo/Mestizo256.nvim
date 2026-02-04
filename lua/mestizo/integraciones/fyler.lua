-- IMPORTANTE: Esta integración no puede lucir bien, pues el complemento no provee las claves necesarias para

local integracion_escencial = require("mestizo.integraciones.escencial")
local util = require("mestizo.util")

return {
	FylerNormal = util.fusionar_tablas(integracion_escencial.SubNormal, integracion_escencial.File),
	FylerNormalNC = { link = "FylerNormal" },

	FylerFSDirectoryName = { link = "Directory" },
	FylerFSDirectoryIcon = { link = "Directory" },
	FylerFSFile = { link = "File" },
	FylerConfirmRed = { ctermfg = 1 },
	FylerIndentMarker = { link = "IndentMarker" },

	FylerGitAdded = { link = "Added" },
	FylerGitUntracked = { link = "Untracked" },
	FylerGitUnstaged = { link = "Unstaged" },
	FylerGitStaged = { link = "Staged" },
	FylerGitDeleted = { link = "Deleted" },
	FylerGitModified = { link = "Modified" },
	FylerGitRenamed = { link = "Modified" },
	FylerGitIgnored = { link = "Ignored" },
	FylerGitConflict = { ctermfg = 5 },

	FylerBorder = { link = "LineNr" },
	FylerRed = { ctermfg = 1 },
	FylerGreen = { ctermfg = 2 },
}
