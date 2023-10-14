local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then
	return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lsp_ok then
	return
end
local mason_tool_ok, mason_tool_installer = pcall(require, 'mason-tool-installer')
if not mason_tool_ok then
	return
end

mason.setup()
mason_lspconfig.setup{
	ensure_installed = {
		"bashls",
		"cssls",
		"dockerls",
        "eslint",
		"gopls",
        "groovyls",
		"html",
        "intelephense",
        "jsonls",
        "jsonnet_ls",
        "lua_ls",
		"pyright",
		"rust_analyzer",
		"tsserver",
		"yamlls",
	}
}
mason_tool_installer.setup{
    ensure_installed = {
        "black",
        "codelldb",
        "eslint",
        "gofumpt",
        "isort",
        "jsonlint",
        "luacheck",
        "php-cs-fixer",
        "php-debug-adapter",
        "phpcbf",
        "prettierd",
        "shellcheck",
        "stylua",
    },
    auto_update = true,
    run_on_start = true,
    -- start_delay = 5000,
    -- debounce_hours = 12,
}
