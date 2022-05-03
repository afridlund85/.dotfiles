local options = {
    autoindent = true,
    clipboard = "unnamedplus",
    cmdheight = 2,
    encoding = "utf-8",
    fileencoding = "utf-8",
--	foldmethod = "expr",
--	foldexpr = "nvim_treesitter#foldexpr()",
    guifont = "DroidSansMono Nerd Font:h12",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    number = true,
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

