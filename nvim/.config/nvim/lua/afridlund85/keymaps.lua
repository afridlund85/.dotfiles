local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- map("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- map("v", "<leader>fv", ":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>")
map("n", "<leader>fa", "<cmd>Telescope resume<CR>")
map("n" ,"<leader>fd", "<cmd>Telescope diagnostics<CR>")

map("n", "<leader>fr", ":lua require('spectre').open()<CR>")
map("n", "<leader>fR", ":lua require('spectre').open_visual({select_word=true})<CR>")
map("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>fb", "<cmd>NvimTreeFindFile<CR>")

--window nav
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

map("n", "<leader>j", "<C-W><C-S>")
map("n", "<leader>l", "<C-W><C-V>")

-- buffer nav
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")
map("n", "<Leader>q", "<cmd>Bdelete<CR>")


-- dap
map("n", "<leader>dt", ":lua require('dapui').toggle()<CR>")
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
map("n", "<leader>dc", "<cmd>DapContinue<CR>")
map("n", "<leader>ds", "<cmd>DapStepOver<CR>")
map("n", "<leader>di", "<cmd>DapStepInto<CR>")
map("n", "<leader>do", "<cmd>DapStepOut<CR>")

-- other
map("n", "<leader><leader>", "<cmd>noh<CR>")
map("i", "<A-h>", "<C-o>h")
map("i", "<A-j>", "<C-o>j")
map("i", "<A-k>", "<C-o>k")
map("i", "<A-l>", "<C-o>l")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("x", "p", [["_dP]])
map("n", "Q", "<nop>")
map("n", "q", "<nop>")
map("n", "z", "<nop>")
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "<C-q>", "<cmd>quit<CR>")
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])--rename words in buffer

