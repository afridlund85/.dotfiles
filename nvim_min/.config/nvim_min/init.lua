vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("options")
require("keymaps")

vim.pack.add({
	{ src = "https://github.com/morhetz/gruvbox" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-luaf" },
})

require("blink.cmp").setup({
	completion = { documentation = { auto_show = false } },
})

require("mason").setup()
require("oil").setup()

vim.lsp.enable({"lua_ls", "intelephense"})

vim.cmd("colorscheme gruvbox")
