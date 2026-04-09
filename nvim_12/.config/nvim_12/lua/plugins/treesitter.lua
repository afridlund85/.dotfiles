require('nvim-treesitter').setup()
require('nvim-treesitter').install {
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"bash",
	"css",
	"dockerfile",
	"go",
	"graphql",
	"html",
	"javascript",
	"json",
	"php",
	"python",
	"regex",
	"rust",
	"scss",
	"sql",
	"tsx",
	"typescript",
	"yaml",
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

require('nvim-treesitter.install').update()

