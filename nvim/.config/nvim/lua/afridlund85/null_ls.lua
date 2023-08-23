local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
    sources = {
        formatting.prettierd,
		formatting.gofmt,
		-- formatting.rustfmt.with({extra_args = { "--edition=2021" }}),
		diagnostics.php,
		-- diagnostics.phpstan,
		-- diagnostics.psalm,
		-- diagnostics.yamlint,
		diagnostics.jsonlint,
		diagnostics.shellcheck
    },
})

