return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/lazydev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local on_attach = function(client, bufnr)
			local function map(mode, lhs, rhs, opts)
				local options = { remap = false, silent = true }
				if opts then
					options = vim.tbl_extend("force", options, opts)
				end
				vim.keymap.set(mode, lhs, rhs, options)
			end
			-- map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "***deprecated*** declarations" })
			-- map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "***deprecated*** definitions" })
			map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
			-- map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "***Deprecated*** Implementations" })
			map("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
			map("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type Definition" })
			map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
			map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })
			map(
				"n",
				"<leader>gr",
				'<cmd>lua require("telescope.builtin").lsp_references()<cr>',
				{ buffer = bufnr, desc = "References" }
			)
			map(
				"n",
				"<leader>gi",
				'<cmd>lua require("telescope.builtin").lsp_implementations()<cr>',
				{ buffer = bufnr, desc = "Implementations" }
			)
			map(
				"n",
				"<leader>gD",
				'<cmd>lua require("telescope.builtin").lsp_definitions()<cr>',
				{ buffer = bufnr, desc = "declaration" }
			)
			map(
				"n",
				"<leader>gd",
				'<cmd>lua require("telescope.builtin").lsp_definitions()<cr>',
				{ buffer = bufnr, desc = "Definitions" }
			)
			--map('n', 'gr', vim.lsp.buf.references, {buffer=bufnr, desc = ''})
			-- map("n", "<leader>cf", function()
			--     require("conform").format({ async = true })
			-- end, { buffer = bufnr, desc = "Code Format" })
			-- map("n", "<leader>cl", function()
			--     require("lint").try_lint()
			-- end, { buffer = bufnr, desc = "Code Lint" })
			-- map('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, {buffer=bufnr, desc = ''})
			if client.name == "intelephense" then
				vim.opt.autoindent = true
			end
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = "rounded",
						source = "always",
						prefix = " ",
						scope = "cursor",
					}
					vim.diagnostic.open_float(nil, opts)
				end,
			})
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig.intelephense.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
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
		})
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			-- cmd = { "$HOME/.local/share/nvim/mason/bin/gopls" },
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
		lspconfig.yamlls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "yml", "yaml", "neon.dist" },
		})
		lspconfig.dockerls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "html", "hbt", "twig", "hbs", "thtml", "handlebars", "html.handlebars" },
		})
		lspconfig.cssls.setup({
			settings = {
				css = {
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})
		lspconfig.bashls.setup({})
		lspconfig.groovyls.setup({
			filetypes = {
				"Jenkinsfile.*",
			},
		})
		lspconfig.sqlls.setup({
			root_dir = function(_)
				return vim.loop.cwd()
			end,
		})
	end,
}
