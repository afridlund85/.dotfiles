local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then
	return
end

mason.setup()
mason_lspconfig.setup{
	ensure_installed = {
		"bashls",
		"cssls",
		"dockerls",
		"gopls",
		"html",
		"intelephense",
		"rust_analyzer",
		"sumneko_lua",
		"tailwindcss",
		"tsserver",
		"yamlls"
	}
}

