local set = vim.keymap.set

set("n", "<leader>j", "<C-W><C-S>", { desc = "split win horizontal" })
set("n", "<leader>l", "<C-W><C-V>", { desc = "split win vertical" })

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
set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "rename word in bufffer" })
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

set("n", "<leader>sr", ":lua require('spectre').open()<CR>", { desc = "search replace" })
set("n", "<leader>sR", ":lua require('spectre').open_visual({select_word=true})<CR>", { desc = "search replace current word" })
