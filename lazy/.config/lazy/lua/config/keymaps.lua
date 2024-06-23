local set = vim.keymap.set

--telescope
set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- set("n", "<C-f>", "<cmd>Telescope live_grep<CR>")
set("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- set("v", "<leader>fv", ":lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>")
set("n", "<leader>fa", "<cmd>Telescope resume<CR>")
set("n" ,"<leader>fd", "<cmd>Telescope diagnostics<CR>")

set("n", "<leader>fr", ":lua require('spectre').open()<CR>")
set("n", "<leader>fR", ":lua require('spectre').open_visual({select_word=true})<CR>")
set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>")
set("n", "<leader>fb", "<cmd>NvimTreeFindFile<CR>")

--window nav
-- set("n", "<C-h>", "<C-w>h")
-- set("n", "<C-j>", "<C-w>j")
-- set("n", "<C-k>", "<C-w>k")
-- set("n", "<C-l>", "<C-w>l")

set("n", "<leader>j", "<C-W><C-S>")
set("n", "<leader>l", "<C-W><C-V>")

-- buffer nav
set("n", "<S-l>", "<cmd>bnext<CR>")
set("n", "<S-h>", "<cmd>bprevious<CR>")
set("n", "<Leader>q", "<cmd>Bdelete<CR>")


-- dap
set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>")
set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
set("n", "<leader>dc", "<cmd>DapContinue<CR>")
set("n", "<leader>ds", "<cmd>DapStepOver<CR>")
set("n", "<leader>di", "<cmd>DapStepInto<CR>")
set("n", "<leader>do", "<cmd>DapStepOut<CR>")

-- other
set("n", "<leader><leader>", "<cmd>noh<CR>")
set("i", "<A-h>", "<C-o>h")
set("i", "<A-j>", "<C-o>j")
set("i", "<A-k>", "<C-o>k")
set("i", "<A-l>", "<C-o>l")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("x", "p", [["_dP]])
set("n", "Q", "<nop>")
set("n", "q", "<nop>")
set("n", "z", "<nop>")
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set("n", "<C-q>", "<cmd>quit<CR>")
set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])--rename words in buffer
