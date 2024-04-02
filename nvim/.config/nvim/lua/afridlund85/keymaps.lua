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
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find file"})
-- map("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {desc = "Find in text"})
-- map("v", "<leader>fv", ":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>")
map("n", "<leader>fa", "<cmd>Telescope resume<CR>", {desc = "Resume Find"})
map("n" ,"<leader>fd", "<cmd>Telescope diagnostics<CR>", {desc = "Diagnostics"})

map("n", "<leader>fr", ":lua require('spectre').open()<CR>", {desc = 'Find Replace'})
map("n", "<leader>fR", ":lua require('spectre').open_visual({select_word=true})<CR>", {desc = "Find Replace Word"})
map("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", {desc = "File Explorer Toggle"})
map("n", "<leader>fb", "<cmd>NvimTreeFindFile<CR>", {desc = "File Explorer Show File"})

--window nav
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

map("n", "<leader>j", "<C-W><C-S>", {desc = "Split window horizontal"})
map("n", "<leader>l", "<C-W><C-V>", {desc = "split window vertical"})

-- buffer nav
map("n", "<S-l>", "<cmd>bnext<CR>", {desc = "Next Buffer"})
map("n", "<S-h>", "<cmd>bprevious<CR>", {desc = "Prev Buffer"})
map("n", "<Leader>q", "<cmd>Bdelete<CR>", {desc = "Close Buffer"})


-- dap
map("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", {desc = "DAP toggle UI"})
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", {desc = "Toggle Breakpoint"})
map("n", "<leader>dc", "<cmd>DapContinue<CR>", {desc = "Continue"})
map("n", "<leader>ds", "<cmd>DapStepOver<CR>", {desc = "Step Over"})
map("n", "<leader>di", "<cmd>DapStepInto<CR>", {desc = "Step Into"})
map("n", "<leader>do", "<cmd>DapStepOut<CR>", {desc = "Step Out"})

-- other
map("n", "<leader><leader>", "<cmd>noh<CR>", {desc = "Clear selection"})
-- map("i", "<A-h>", "<C-o>h", {desc = "Move cursor in insert mode left"})
-- map("i", "<A-j>", "<C-o>j", {desc = "Move cursor in insert mode down"})
-- map("i", "<A-k>", "<C-o>k", {desc = "Move cursor in insert mode up"})
-- map("i", "<A-l>", "<C-o>l", {desc = "Move cursor in insert mode right"})

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
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Rename word in buffer"})

