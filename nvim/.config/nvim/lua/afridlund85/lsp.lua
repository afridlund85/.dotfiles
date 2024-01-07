local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_tool_installer = require "mason-tool-installer"
local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local conform = require "conform"
local lint = require "lint"

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
mason_tool_installer.setup {
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

conform.setup({
    formatters_by_ft = {
        php = { { 'phpcbf', 'php_cs_fixer' } },       --first of
        lua = { "stylua" },
        python = { "isort", "black" },                --both
        javascript = { { "prettierd", "prettier" } }, --first of
    },
})
lint.linters_by_ft = {
    php = { 'php', },
    javascript = { 'eslint' },
    -- lua = { 'luacheck' },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end,
})

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', bufopts)
    --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f', function() require("conform").format { async = true } end, bufopts)
    -- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    if client.name == 'intelephense' then
        vim.opt.autoindent = true
    end
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.intelephense.setup {
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
    filetypes = { 'yml', 'yaml', 'neon.dist' }
}
lspconfig.dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
lspconfig.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'hbt', 'twig', 'hbs', 'thtml', 'handlebars', 'html.handlebars' }
}
lspconfig.cssls.setup {
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
lspconfig.groovyls.setup {
    filetypes = {
        'Jenkinsfile'
    }
}
lspconfig.ember.setup {}

