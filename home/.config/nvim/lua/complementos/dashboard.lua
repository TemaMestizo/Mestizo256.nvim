return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup(require("mestizo256.integraciones_especiales.dashboard")())
	end,
}
