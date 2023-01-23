local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

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
