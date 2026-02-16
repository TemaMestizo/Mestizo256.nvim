return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").config({
			providers = {
				-- "hover.providers.diagnostic",
				-- "hover.providers.lsp",
				-- "hover.providers.gh",
				-- "hover.providers.fold_preview",
				"hover.providers.highlight",
				-- 'hover.providers.dictionary',
				-- 'hover.providers.dap',
				-- 'hover.providers.man',
				-- 'hover.providers.gh_user',
				-- 'hover.providers.jira',
			},
			preview_opts = {
				border = "rounded",
			},
			preview_window = false,
			title = true,
		})
	end,
	["keys"] = {
		{
			"K",
			function()
				require("hover").open()
			end,
			mode = {
				"n",
			},
			desc = "Hover: Mostrar información sobre el elemento",
		},
	},
}
