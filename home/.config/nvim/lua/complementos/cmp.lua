return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			window = {
				completion = {
					border = "rounded",
					winhighlight = table.concat({
						"Normal:CmpNormal",
						"FloatBorder:CmpBorder",
						"CursorLine:CmpCursorLine",
						"Search:CmpSearch",
					}, ","),
				},
				documentation = {
					border = "rounded",
					winhighlight = table.concat({
						"Normal:CmpDocumentationNormal",
						"FloatBorder:CmpDocumentationBorder",
						"CursorLine:CmpDocumentationCursorLine",
						"Search:CmpDocumentationSearch",
					}, ","),
				},
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}),
		})

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		local nombres_de_lsp = vim.tbl_keys(vim.lsp._enabled_configs)
		local capacidades = require("cmp_nvim_lsp").default_capabilities()
		for _, nombre in ipairs(nombres_de_lsp) do
			vim.lsp.config(nombre, { capabilities = capacidades })
		end
	end,
}
