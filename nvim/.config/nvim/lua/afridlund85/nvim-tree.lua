local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

vim.cmd [[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

nvim_tree.setup {
}
