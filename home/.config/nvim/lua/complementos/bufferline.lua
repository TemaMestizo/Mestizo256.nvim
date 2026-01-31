return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = { "BufEnter", "BufReadPost", "BufWinEnter", "BufRead" },
	config = function()
		require("bufferline").setup({
			options = {
				offsets = require("mestizo.util").map({ "fyler", "neo-tree" }, function(tipo_de_archivo)
					return {
						filetype = tipo_de_archivo,
						text = "Archivos",
						text_align = "center",
						separator = true,
					}
				end),
			},
		})
		require("mestizo").integraciones_especiales.bufferline()
	end,
	keys = {
		{
			"<c-t>",
			"<cmd>tabnew<cr>",
			desc = "Nueva pestaña",
		},
		{
			"<m-tab>",
			"<cmd>tabnext<cr>",
			desc = "Siguiente pestaña",
		},
		{
			"<s-tab>",
			function()
				require("bufferline").cycle(-1)
			end,
			desc = "Bufferline: Anterior buffer",
		},
		{
			"<space>bCe",
			function()
				require("bufferline").close_with_pick()
			end,
			desc = "Bufferline: Elegir buffer para cerrar",
		},
		{
			"<space>bCh",
			function()
				require("bufferline").close_in_direction("left")
			end,
			desc = "Bufferline: Cerrar los bufferes a la izquierda",
		},
		{
			"<space>bCl",
			function()
				require("bufferline").close_in_direction("right")
			end,
			desc = "Bufferline: Cerrar los bufferes a la derecha",
		},
		{
			"<space>bCo",
			function()
				require("bufferline").close_others()
			end,
			desc = "Bufferline: Cerrar los demás bufferes",
		},
		{
			"<space>bc",
			"<cmd>bp<bar>sp<bar>bn<bar>bd<CR>",
			desc = "Bufferline: Cerrar buffer",
		},
		{
			"<space>be",
			function()
				require("bufferline").pick()
			end,
			desc = "Bufferline: Elegir buffer",
		},
		{
			"<space>bmh",
			function()
				require("bufferline").move(-1)
			end,
			desc = "Bufferline: Mover buffer a la izquierda",
		},
		{
			"<space>bml",
			function()
				require("bufferline").move(1)
			end,
			desc = "Bufferline: Mover buffer a la derecha",
		},
		{
			"<space>br",
			":BufferLineTabRename ",
			desc = "Bufferline: Renombrar pestaña",
		},
		{
			"<tab>",
			function()
				require("bufferline").cycle(1)
			end,
			desc = "Bufferline: Siguiente buffer",
		},
	},
}
