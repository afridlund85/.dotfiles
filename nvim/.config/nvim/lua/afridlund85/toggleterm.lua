local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup{
	open_mapping = [[<c-t>]],
	-- direction = "float",
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 3,
}

