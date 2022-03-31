local options = {
    autoindent = true,
    clipboard = "unnamedplus",
    cmdheight = 2,
    encoding = "utf-8",
    fileencoding = "utf-8",
	foldenable = false, -- open all files unfolded, use zi or F10 keybind to toggle fold
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
    guifont = "DroidSansMono Nerd Font:h12",
    hlsearch = true,
    ignorecase = true,
	laststatus = 3,
    mouse = "a",
    number = true,
	relativenumber = true,
    ruler = true,
    shiftwidth = 4,
    showmode = false,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    smarttab = true,
    softtabstop = 4,
	splitbelow = true,
	splitright = true,
    tabstop = 4,
    termguicolors = true,
    wrap = false
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.cmd [[
	if executable('ag')
		let g:ackprg = 'ag --vimgrep'
	endif
]]
