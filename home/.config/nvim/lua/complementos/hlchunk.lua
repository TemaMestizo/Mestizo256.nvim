return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup(require("mestizo256.integraciones_especiales.hlchunk").obtener())
	end,
}
