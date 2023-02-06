local treesitter_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_ok then
	return
end

local treesitter_context_ok, treesitter_context = pcall(require, 'treesitter-context')
if not treesitter_context_ok then
	return
end

treesitter_context.setup{}

nvim_treesitter.setup {
  ensure_installed = {
	  "bash",
	  "css",
	  "dockerfile",
	  "go",
	  "graphql",
	  "html",
	  "javascript",
	  "json",
	  "lua",
	  "php",
	  "python",
	  "regex",
	  "rust",
	  "scss",
	  "tsx",
	  "typescript",
	  "vim",
	  "yaml"

  },
  sync_install = false,
  ignore_install = { "r", "beancount", "swift"},
  highlight = {
    enable = true,
    disable = { "r", "beancount", "swift"},
    additional_vim_regex_highlighting = false,
  },
  indent = {
	enabled = true
  }
}
