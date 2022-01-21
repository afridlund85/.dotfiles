function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--fuzzyfind
map("n", "<C-p>", "<cmd>FZF<CR>")
--nerdtree
map("n", "<leader>t", "<cmd>NERDTreeToggle<CR>")
map("n", "<leader>f", "<cmd>NERDTreeFind<CR>")
--window nav
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- buffer nav
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<Leader>q", "<cmd>Bdelete<CR>", opts)
--force
map("n", "<C-w>", "<cmd>w!<CR>", opts)
map("n", "<C-q>", "<cmd>q!<CR>", opts)
