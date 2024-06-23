return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
		config = function()
			local dap = require("dap")
			local mason_registry = require("mason-registry")

			local codelldb = mason_registry.get_package("php-debug-adapter")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local php_debug_path = extension_path .. "out/phpDebug.js"

			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { php_debug_path },
			}

			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Xdebug PHP",
					port = 9003,
					localSourceRoot = "/home/andreas.fridlund@fnox.it/dev/fortnox/webapp",
					log = "true",
				},
				{
					type = "php",
					request = "launch",
					name = "Remote F3 UI",
					port = 9000,
					log = true,
					serverSourceRoot = "/storage/vol3/fortnox-andfri/ui",
					localSourceRoot = "/home/andreas.fridlund@fnox.it/dev/fortnox/ui",
				},
				{
					type = "php",
					request = "launch",
					name = "Remote F3 BACKEND",
					port = 9000,
					log = true,
					serverSourceRoot = "/storage/vol3/fortnox-andfri/webapp",
					localSourceRoot = "/home/andreas.fridlund@fnox.it/dev/fortnox/webapp",
				},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		opts = {},
	},
}
