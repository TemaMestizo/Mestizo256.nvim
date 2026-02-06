vim.opt.cursorline = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.shell = "fish"
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

vim.o.winborder = "rounded"

vim.api.nvim_create_user_command("Pistas", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

vim.fn.sign_define("DiagnosticSignError", { text = "󰊠 " })
vim.fn.sign_define("DiagnosticSignInfo", { text = "󰊠 " })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰊠 " })
vim.fn.sign_define("DiagnosticSignWarn", { text = "󰊠 " })
