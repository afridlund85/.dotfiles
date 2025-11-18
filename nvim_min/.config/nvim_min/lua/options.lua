local opt = vim.opt
local o = vim.o

opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.guifont = "RobotoMono Nerd Font:h12"
opt.mouse = "a"

o.background = "dark"

opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = false
opt.signcolumn = "yes"
opt.ruler = true
opt.scrolloff = 5
opt.colorcolumn = "80"

opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true

opt.cmdheight = 2
opt.foldenable = false -- open all files unfolded, use zi or F10 keybind to toggle fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.termguicolors = true
opt.laststatus = 3
opt.list=true
opt.listchars="tab:› ,eol:¬,trail:⋅"
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.shortmess:append "c"
