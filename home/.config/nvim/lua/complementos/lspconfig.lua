return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		vim.lsp.config("ts_ls", {
			["settings"] = {
				["javascript"] = {
					["inlayHints"] = {
						["includeInlayEnumMemberValueHints"] = true,
						["includeInlayFunctionLikeReturnTypeHints"] = true,
						["includeInlayFunctionParameterTypeHints"] = true,
						["includeInlayParameterNameHints"] = "all",
						["includeInlayParameterNameHintsWhenArgumentMatchesName"] = true,
						["includeInlayPropertyDeclarationTypeHints"] = true,
						["includeInlayVariableTypeHints"] = true,
					},
				},
				["typescript"] = {
					["inlayHints"] = {
						["includeInlayEnumMemberValueHints"] = true,
						["includeInlayFunctionLikeReturnTypeHints"] = true,
						["includeInlayFunctionParameterTypeHints"] = true,
						["includeInlayParameterNameHints"] = "all",
						["includeInlayParameterNameHintsWhenArgumentMatchesName"] = true,
						["includeInlayPropertyDeclarationTypeHints"] = true,
						["includeInlayVariableTypeHints"] = true,
					},
				},
			},
		})

		vim.lsp.config("gopls", {
			["settings"] = {
				["gopls"] = {
					["ui.inlayhint.hints"] = {
						["assignVariableTypes"] = true,
						["compositeLiteralFields"] = true,
						["compositeLiteralTypes"] = true,
						["constantValues"] = true,
						["functionTypeParameters"] = true,
						["parameterNames"] = true,
						["rangeVariableTypes"] = true,
					},
				},
			},
		})

		vim.lsp.enable("ts_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("nixd")
		vim.lsp.enable("nil")
	end,
}
