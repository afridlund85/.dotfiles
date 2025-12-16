require("fzf-lua").setup({"ivy"})

vim.keymap.set("n", "<leader>fr", require("fzf-lua").resume, {desc = "fzf resume"})
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, {desc = "fzf files"})
vim.keymap.set("n", "<leader>ft", require("fzf-lua").live_grep, {desc = "fzf live_grep"})
vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers , {desc = "fzf buffers"})
vim.keymap.set("n", "<leader>gs", require("fzf-lua").git_status , {desc = "fzf git status"})
vim.keymap.set("n", "<leader>gb", require("fzf-lua").git_blame , {desc = "fzf git blame"})
