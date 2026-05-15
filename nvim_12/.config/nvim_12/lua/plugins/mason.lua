require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		-- "bashls",
		-- "cssls",
		-- "dockerls",
		-- "eslint",
		"gopls",
		-- "groovyls",
		"html",
		"intelephense",
		"jsonls",
		-- "jsonnet_ls",
		"lua_ls",
		-- "sqlls",
		-- "pyright",
		-- "rust_analyzer",
		"ts_ls",
		"yamlls",
	},
})
require("mason-tool-installer").setup({
	ensure_installed = {
		-- "black",
		"codelldb",
		"eslint",
		"gofumpt",
		-- "isort",
		"jsonlint",
		"luacheck",
		"php-cs-fixer",
		"php-debug-adapter",
		"phpcbf",
		"phpcs",
		"prettierd",
		"shellcheck",
		"stylua",
	},
})
