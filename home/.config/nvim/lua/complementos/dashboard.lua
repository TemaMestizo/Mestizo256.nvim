return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup(require("mestizo256.integraciones_especiales.dashboard").obtener({
			config = {
				center = {
					{ desc = "[ Anfigeno] [ anfigenos] [ Anfigeno]" },
				},
			},
		}))
	end,
}
