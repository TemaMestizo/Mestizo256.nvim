return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup(require("mestizo256.integraciones_especiales.supermaven").obtener())
	end,
}
