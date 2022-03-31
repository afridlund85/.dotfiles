function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--fuzzyfind
map("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", opts)
map("n", "<C-F>", "<cmd>lua require('fzf-lua').live_grep()<CR>", opts)

--nvim-tree
--map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
--map("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>", opts)

--nerdtree
map("n", "<leader>e", "<cmd>NERDTreeToggle<CR>", opts)
map("n", "<leader>f", "<cmd>NERDTreeFind<CR>", opts)

--window nav
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>j", "<C-W><C-S>", opts)
map("n", "<leader>l", "<C-W><C-V>", opts)

-- buffer nav
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<Leader>q", "<cmd>Bdelete<CR>", opts)

--force
map("n", "<C-w>", "<cmd>w!<CR>", opts)
map("n", "<C-q>", "<cmd>q!<CR>", opts)

-- other
map("n", "<leader><leader>", "<cmd>noh<CR>", opts)
map("n", "<F10>", "zi", opts)
map("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

