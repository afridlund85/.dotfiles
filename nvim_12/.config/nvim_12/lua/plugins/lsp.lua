vim.lsp.enable({ "lua_ls", "intelephense", "gopls" })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(event)
-- 		local set = function(mode, rhs, lhs, desc)
-- 			vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc })
-- 		end
--
-- 		set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "lsp hover")
-- 		set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", "references")
-- 		set("n", "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", "goto definition")
-- 		set({ "n", "x" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "code format")
-- 		-- format code with conform instead
-- 	end,
-- })
