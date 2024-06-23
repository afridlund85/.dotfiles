return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			php = { "phpcbf" }, --first of
			lua = { "stylua" },
			python = { "isort", "black" }, --both
			javascript = { { "prettierd", "prettier" } }, --first of
			go = { "gofumpt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = false,
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
