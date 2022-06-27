
local ts_autotag_status_ok, ts_autotag = pcall(require, 'nvim-ts-autotag')
if not ts_autotag_status_ok then
	return
end

ts_autotag.setup()
