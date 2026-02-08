return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				style = require("mestizo256.integraciones_especiales.hlchunk").obtener(),
			},
		})
	end,
}
