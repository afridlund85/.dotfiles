vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- vim.opt.guifont = "RobotoMono Nerd Font:h12"
vim.opt.mouse = ""
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.cmd "colorscheme gruvbox"

vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.signcolumn = "yes"
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.colorcolumn = "80"

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.cmdheight = 2
vim.opt.foldenable = false -- open all files unfolded, use zi or F10 keybind to toggle fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.list=true
vim.opt.listchars="tab:› ,eol:¬,trail:⋅"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.shortmess:append "c"
-- vim.opt.iskeyword:append "-"

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

-- vim.cmd[[
-- try
--   colorscheme gruvbox
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]
