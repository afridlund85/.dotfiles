require("conform").setup({
	formatters_by_ft = {
		php = { "phpcbf" },
		lua = { "stylua" },
		-- python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true  },
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
})
