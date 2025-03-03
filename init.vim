call plug#begin('~/.local/share/nvim/plugged')

" Fuzzy complete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Colorscheme
Plug 'sainnhe/everforest'

"Statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do' : ':TSUpdate'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" or                                , { 'branch': '0.1.x' }

" Quickfix
Plug 'kevinhwang91/nvim-bqf'
Plug 'arsham/listish.nvim'
Plug 'arsham/arshlib.nvim'

call plug#end()

" TODO buffer navigation rebindings: cycle for qf and prev file
" TODO error navigation, open all errors in qf
" TODO open term in open file location
" TODO null-ls and disable text completions
" TODO turn off completions for paths
" TODO debuggers

syntax enable
filetype plugin indent on

" colorscheme
let g:everforest_background = 'hard'
colorscheme everforest
set termguicolors

" tabs
set tabstop=2
set shiftwidth=2
set expandtab

" numbers
set number
set relativenumber
set showcmd
set cursorline
set noshowmode

"set cursorline
set wildmenu
set wildmode=longest:full
set scrolloff=1

"search
set showmatch
set incsearch
set hlsearch
set smartcase "only case sensitive if uppercase letter

" Use system keyboard
set clipboard=unnamedplus

" Persistent undo
if hostname() == "qburke-framework"
  set undodir=/usr/local/undo.nvim
  set undofile
endif

" GDB integration
packadd termdebug

lua << END

require("qburke")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

END
