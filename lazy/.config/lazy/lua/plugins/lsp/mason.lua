return {
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "bashls",
                "cssls",
                "dockerls",
                "eslint",
                "gopls",
                -- "groovyls",
                "html",
                "intelephense",
                "jsonls",
                "jsonnet_ls",
                "lua_ls",
                "sqlls",
                "pyright",
                "rust_analyzer",
                "tsserver",
                "yamlls",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "black",
                "codelldb",
                "eslint",
                "gofumpt",
                "isort",
                "jsonlint",
                "luacheck",
                -- "php-cs-fixer",
                "php-debug-adapter",
                "phpcbf",
                "phpcs",
                "prettierd",
                "shellcheck",
                "stylua",
            },
            auto_update = true,
            run_on_start = true,
        },
    },
}
