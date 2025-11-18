local set = vim.keymap.set

set("n", "<leader>j", "<C-W><C-S>")
set("n", "<leader>l", "<C-W><C-V>")

-- other
set("n", "<leader><leader>", "<cmd>noh<CR>")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("x", "p", [["_dP]])
set("n", "z", "<nop>")
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- set("n", "<C-q>", "<cmd>quit<CR>")
set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])--rename words in buffer

set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
set("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
set("n", "<leader>fa", "<cmd>Telescope resume<CR>")
set("n" ,"<leader>fd", "<cmd>Telescope diagnostics<CR>")
