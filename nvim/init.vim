set autoindent expandtab tabstop=2 shiftwidth=2
set nocompatible
set wrap
set encoding=utf-8
set number
set laststatus=2
set hidden
set noerrorbells
set incsearch
set nohlsearch
set scrolloff=12
set signcolumn=yes
set autoindent
set noswapfile

call plug#begin()

" Theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install --frozen-lockfile --production',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig' " Config for language servers

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Plugin for better syntax highlighting

Plug 'kyazdani42/nvim-web-devicons' " Plugin for different file type icons
Plug 'kyazdani42/nvim-tree.lua' " Plugin for tree view

call plug#end()

" Theme
set termguicolors
set background=dark
colorscheme onehalfdark 
highlight Normal guibg=none
" End theming

" Nvim Tree
set splitright

let mapleader = " "

nnoremap <leader>b :NvimTreeFocus<cr>

" let g:prettier#quickfix_enabled = 0
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

lua << EOF
  require'lspconfig'.tsserver.setup{}
  require'nvim-treesitter.configs'.setup{
	  highlight = {
	    enable = true,
	  },
	}
  require'nvim-tree'.setup{ view = { side = 'left' } }
EOF

