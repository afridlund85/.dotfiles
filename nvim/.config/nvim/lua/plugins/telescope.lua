return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
	},
	config = function()
		-- Disable preview on binaries
		local previewers = require("telescope.previewers")
		local Job = require("plenary.job")
		local new_maker = function(filepath, bufnr, opts)
			filepath = vim.fn.expand(filepath)
			Job:new({
				command = "file",
				args = { "--mime-type", "-b", filepath },
				on_exit = function(j)
					local mime_type = vim.split(j:result()[1], "/")[1]
					if mime_type == "text" then
						previewers.buffer_previewer_maker(filepath, bufnr, opts)
					else
						-- maybe we want to write something to the buffer here
						vim.schedule(function()
							vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
						end)
					end
				end,
			}):sync()
		end
		require("telescope").setup({
			defaults = {
				buffer_previewer_maker = new_maker,
				-- layout_strategy = "vertical",
				layout_strategy = "bottom_pane",
                layout_config = { height = 0.75}
			},
			pickers = {
				lsp_references = {
                    -- theme = "ivy",
					fname_width = 120,
					-- path_display = function(opts, path)
					-- 	local tail = require("telescope.utils").path_tail(path)
					-- 	return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
					-- end,
				},
				lsp_definitions = {
                    -- theme = "ivy",
					fname_width = 120,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("live_grep_args")
	end,
}
