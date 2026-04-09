return {
	formatters_by_ft = {
		php = { "phpcbf" }, --first of
		lua = { "stylua" },
		-- python = { "isort", "black" }, --both
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
}
