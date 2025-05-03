local treesitter_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_ok then
    return
end

local treesitter_context_ok, treesitter_context = pcall(require, 'treesitter-context')
if not treesitter_context_ok then
    return
end

treesitter_context.setup {}

---@type TSConfig
---@diagnostic disable-next-line: missing-fields
nvim_treesitter.setup {
    ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "bash",
        "css",
        "dockerfile",
        "go",
        "graphql",
        "html",
        "javascript",
        "json",
        "php",
        "python",
        "regex",
        "rust",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "yaml"

    },
    highlight = {
        enable = true,
    },
    indent = {
        enabled = true
    }
}
