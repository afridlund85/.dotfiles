local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

vim.cmd [[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

nvim_tree.setup {
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	filters = {
		dotfiles = false
	},
	view = {
		width = 30,
		side = 'left',
		preserve_window_proportions = false,
	},
}
