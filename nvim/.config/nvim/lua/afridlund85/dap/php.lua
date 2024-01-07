local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("php-debug-adapter")
local extension_path = codelldb:get_install_path() .. "/extension/"
local php_debug_path = extension_path .. "out/phpDebug.js"

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { php_debug_path }
	-- command = "/home/andreas/.local/share/nvim/mason/bin/php-debug-adapter",
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Xdebug PHP",
		port = 9003,
		-- pathMapping= {
		-- 	["/storage/vol3/fortnox-andfri"] = "/home/andreas/dev/fortnox"
		-- },
	},
	{
		type = "php",
		request = "launch",
		name = "Remote F3 UI",
		port = 9000,
		log = true,
		serverSourceRoot = "/storage/vol3/fortnox-andfri/ui",
		localSourceRoot = "/home/andreas/dev/fortnox/ui"
	},
	{
		type = "php",
		request = "launch",
		name = "Remote F3 BACKEND",
		port = 9000,
		log = true,
		serverSourceRoot = "/storage/vol3/fortnox-andfri/webapp",
		localSourceRoot = "/home/andreas/dev/fortnox/webapp"
	}
}
