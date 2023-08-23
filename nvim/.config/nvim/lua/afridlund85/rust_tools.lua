local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
	return
end

local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rust_tools.setup({
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
	server = {
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<Leader>k", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
			vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr })
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
		end,
	},
	tools = {
		hover_actions = {
			auto_focus = true,
		},
	},
})
