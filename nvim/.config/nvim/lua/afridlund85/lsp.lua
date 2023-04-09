local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end
local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
	return
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', bufopts)
	--vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	if  client.name == 'intelephense' then
		vim.opt.autoindent = true
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
-- lspconfig.intelephense.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }
lspconfig.phpactor.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.yamlls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.dockerls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.cssls.setup{
	settings = {
		css = {
			lint = {
				unknownAtRules = 'ignore',
			},
		},
	},
}

lspconfig.tailwindcss.setup {}

lspconfig.bashls.setup {}

lspconfig.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
