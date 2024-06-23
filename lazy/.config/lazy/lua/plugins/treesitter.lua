return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"gbprod/php-enhanced-treesitter.nvim",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"bash",
					"css",
					"dockerfile",
					"go",
					"graphql",
					"html",
					"javascript",
					"json",
					"php",
					"python",
					"regex",
					"rust",
					"scss",
					"sql",
					"tsx",
					"typescript",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
