local claves = {
	NoiceCmdlinePopupTitle = { link = "Title" },
	NoicePopup = { link = "Normal" },
	NoicePopupBorder = { link = "WinSeparator" },
}

---@param clave string
---@param color_principal number
local function agregar_claves_de_noice(clave, color_principal)
	claves["NoiceCmdlinePopupTitle" .. clave] = { ctermfg = 0, ctermbg = color_principal }
	claves["NoiceCmdlinePopupBorder" .. clave] = { ctermfg = color_principal }
	claves["NoiceCmdlineIcon" .. clave] = { ctermfg = color_principal }
end

agregar_claves_de_noice("Cmdline", 1)
agregar_claves_de_noice("Lua", 4)
agregar_claves_de_noice("Search", 3)
agregar_claves_de_noice("IncRename", 2)
agregar_claves_de_noice("Help", 3)

return claves
