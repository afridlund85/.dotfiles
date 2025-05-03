local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		command = '~/.local/bin/codelldb',
		args = {"--port", "${port}"},
	}
}

dap.configurations.rust = {{
	name = "Launch file",
	type = "codelldb",
	request = "launch",
	program = function()
		return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
}}

-- dap.configurations.rust = {
-- 	{
-- 		name = 'Launch',
-- 		type = 'lldb',
-- 		request = 'launch',
-- 		program = function()
-- 			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- 		end,
-- 		cwd = '${workspaceFolder}',
-- 		stopOnEntry = false,
-- 		args = {},
-- 	}
-- }
