local set = vim.keymap.set

-- set("n", "<C-j>", "<C-W><C-S>", { desc = "split win horizontal" })
-- set("n", "<C-l>", "<C-W><C-V>", { desc = "split win vertical" })
set("n", "<leader>wj", "<C-W><C-S>", { desc = "win split horizontal" })
set("n", "<leader>wl", "<C-W><C-V>", { desc = "win split vertical" })
set("n", "<leader>h", "<C-W>h", { desc = "win nav left" })
set("n", "<leader>j", "<C-W>j", { desc = "win nav down" })
set("n", "<leader>k", "<C-W>k", { desc = "win nav up" })
set("n", "<leader>l", "<C-W>l", { desc = "win nav right" })

set("n", "<leader>bh", ":bprevious<CR>", { desc = "buffer next" })
set("n", "<leader>bl", ":bnext<CR>", { desc = "buffer prev" })
set("n", "<leader>bd", ":bd<CR>", { desc = "buffer del" })
set("n", "<leader>bn", ":benew<CR>", { desc = "buffer new" })
set("n", "<leader>bf", require("fzf-lua").buffers , {desc = "buffer find(fzf)"})

-- other
-- set("n", "<leader><leader>", "<cmd>noh<CR>")
set("n", "<CR>", "<cmd>noh<CR>", {noremap = true})

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

-- search replace with spectre
set("n", "<leader>sr", ":lua require('spectre').open()<CR>", { desc = "search replace" })
set("n", "<leader>sR", ":lua require('spectre').open_visual({select_word=true})<CR>", { desc = "search replace current word" })

--lsp and code commands
set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {desc = "lsp hover"})
-- set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", {desc = "references"})
-- set("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", {desc = "goto definition"})
set("n", "<leader>cr", require("fzf-lua").lsp_references, {desc = "references"})
set("n", "<leader>cd", require("fzf-lua").lsp_definitions, {desc = "goto definition"})
set({ "n", "x" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc =  "Format code in buffer(LSP)"})
set("n", "<leader>cF", ":lua require('conform').format({ async = true })<CR>", { desc = "Format code in buffer(conform)"})

-- search files and text
set("n", "<leader>fr", require("fzf-lua").resume, {desc = "fzf resume"})
set("n", "<leader>ff", require("fzf-lua").files, {desc = "find files(fzf)"})
set("n", "<leader>ft", require("fzf-lua").live_grep, {desc = "find text (fzf live_grep(ripgrep))"})

-- git
set("n", "<leader>gs", require("fzf-lua").git_status , {desc = "git status"})
set("n", "<leader>gb", require("fzf-lua").git_blame , {desc = "git blame"})
