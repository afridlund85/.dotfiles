return {
	"mfussenegger/nvim-lint",
    keys = {
		{
			"<leader>cl",
			function()
				require("lint").try_lint()
			end,
			mode = "",
			desc = "Code Lint",
		},
    },
	config = function()
		require("lint").linters_by_ft = {
			php = { "php", "phpcs" },
			javascript = { "eslint" },
			lua = { "luacheck" },
		}
	end,
}
