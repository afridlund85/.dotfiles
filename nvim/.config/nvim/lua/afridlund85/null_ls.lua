local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local utils_status_ok, null_ls_utils = pcall(require, "null-ls.utils")
if not utils_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    root_dir = null_ls_utils.root_pattern("composer.json", "package.json", "Makefile", ".git"),
    sources = {
        formatting.prettierd,
        formatting.gofmt,
        -- formatting.rustfmt.with({extra_args = { "--edition=2021" }}),
        -- diagnostics.phpcs.with({
        --           prefer_local = "vendor/bin",
        --       }),
        -- diagnostics.phpstan,
        -- diagnostics.psalm,
        -- diagnostics.yamlint,
        diagnostics.jsonlint,
        diagnostics.shellcheck,
        formatting.phpcbf.with({
            prefer_local = "vendor/bin",
        })
    },
})
