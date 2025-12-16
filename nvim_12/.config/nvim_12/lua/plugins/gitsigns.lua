require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>gb", gs.blame, { desc = "git blame" })
		map("n", "<leader>gl", function()
			gs.blame_line({ full = true })
		end, { desc = "git blame line" })
		map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "git blame line toggle" })
		map("n", "<leader>gd", gs.diffthis, { desc = "git diffthis" })
		map("n", "<leader>gD", function()
			gs.diffthis("~")
		end, { desc = "git diffthis ~" })
	end,
})
