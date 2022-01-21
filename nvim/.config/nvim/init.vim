call plug#begin('~/.config/nvim/plugged')
" Libs
Plug 'nvim-lua/plenary.nvim'

" LSP, Code complete & snippets etc
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'onsails/lspkind-nvim'
Plug 'steelsojka/headwind.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'matze/vim-move'

" Theme & style
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim' " gitgutter

" files, nav & buffers
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'akinsho/bufferline.nvim'
Plug 'moll/vim-bbye'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" always last
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Theme
set termguicolors
syntax on
set background=dark
set guifont=DroidSansMono\ Nerd\ Font\ 12
colorscheme gruvbox

set encoding=UTF-8
set clipboard+=unnamedplus
set ignorecase
set showmode
set number
set nowrap
set ruler
set autoindent

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

lua require('afridlund85')

"
let NERDTreeShowHidden=1
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

