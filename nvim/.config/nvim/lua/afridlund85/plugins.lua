local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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

	-- LSP, Code complete & snippets etc
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
	}
	use 'nvim-treesitter/nvim-treesitter-context'
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig'
	}
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
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'matze/vim-move'
	use 'windwp/nvim-autopairs'
	use 'steelsojka/headwind.nvim'
	use 'numToStr/Comment.nvim'
	use 'windwp/nvim-ts-autotag'

	-- DAP
	use 'mfussenegger/nvim-dap'
	use 'mfussenegger/nvim-dap-python'
	use 'rcarriga/nvim-dap-ui'

	-- Theme & style
	use 'morhetz/gruvbox'
	use 'nvim-lualine/lualine.nvim'
	use 'lewis6991/gitsigns.nvim'

	-- files, nav & buffers
	-- use 'preservim/nerdtree'
	use 'nvim-tree/nvim-tree.lua'
	use 'akinsho/bufferline.nvim'
	use 'moll/vim-bbye'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{ "nvim-telescope/telescope-live-grep-args.nvim"},
		}
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {"akinsho/toggleterm.nvim", tag = '*'}
	use {
		'nvim-pack/nvim-spectre',
		requires = {
			{'nvim-lua/plenary.nvim'},
		}
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {}
		end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
