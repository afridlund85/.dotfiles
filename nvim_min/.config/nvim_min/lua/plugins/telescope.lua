require("telescope").setup({
	defaults = {
		layout_strategy = "bottom_pane",
		layout_config = { height = 0.75, prompt_position = "bottom" }
	},
	pickers = {
		lsp_references = {
			fname_width = 120,
		},
		lsp_definitions = {
			fname_width = 120,
		},
	},
	extensions = {
		-- fzf = {
		-- 	fuzzy = true, -- false will only do exact matching
		-- 	override_generic_sorter = true, -- override the generic sorter
		-- 	override_file_sorter = true, -- override the file sorter
		-- 	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		-- },
	},
})
-- require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

