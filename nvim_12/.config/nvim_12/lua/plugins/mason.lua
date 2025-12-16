require("mason").setup()
require("mason-lspconfig").setup{
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
}
