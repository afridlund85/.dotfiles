local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

dap.adapters.php = {
	type = "executable",
	command = "/home/andreas/.local/share/nvim/mason/bin/php-debug-adapter",
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Listen for Xdebug",
		port = "9003"
	}
}
