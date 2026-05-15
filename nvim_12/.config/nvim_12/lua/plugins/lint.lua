require("lint").linters_by_ft = {
	php = { "php", "phpcs" },
	javascript = { "eslint" },
	lua = { "luacheck" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "BufAdd" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
