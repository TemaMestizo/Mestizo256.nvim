return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup(require("mestizo.integraciones_especiales.dashboard")())
	end,
}
