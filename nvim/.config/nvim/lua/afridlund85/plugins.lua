local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	--print "Installing packer close and reopen Neovim..."
	--vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

vim.cmd [[
    autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'christoomey/vim-tmux-navigator'
    -- use {
    --     "max397574/better-escape.nvim",
    --     config = function()
    --         require("better_escape").setup({mapping = {"kj"}})
    --     end,
    -- }
	-- LSP, Code complete & snippets etc
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
	use 'nvim-treesitter/nvim-treesitter-context'
    use "gbprod/php-enhanced-treesitter.nvim"
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
        'WhoIsSethDaniel/mason-tool-installer.nvim'
	}
	use 'mfussenegger/nvim-lint'
	use 'stevearc/conform.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'onsails/lspkind-nvim'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use 'matze/vim-move'
	use {
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup() end
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}
	use {
		'windwp/nvim-ts-autotag',
		config = function() require('nvim-ts-autotag').setup() end
	}
	use {
		'simrat39/rust-tools.nvim',
		requires = 'neovim/nvim-lspconfig',
	}

	-- DAP
	use 'mfussenegger/nvim-dap'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
	use 'mfussenegger/nvim-dap-python'
	-- use 'rcarriga/nvim-dap-ui'

	-- Theme & style
	use 'morhetz/gruvbox'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	-- files, nav & buffers
	-- use 'preservim/nerdtree'
	use 'nvim-tree/nvim-tree.lua'
	use {
		'akinsho/bufferline.nvim',
		tag = "*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function() require('bufferline').setup() end
	}
	use 'moll/vim-bbye'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		}
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { "akinsho/toggleterm.nvim", tag = '*' }
	use {
		'nvim-pack/nvim-spectre',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('spectre').setup() end
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {}
		end
	}

    use{
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
