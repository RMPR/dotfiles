set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set secure
set relativenumber
set number
set hidden
set noerrorbells
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile
set incsearch
set termguicolors
set scrolloff=10
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set history=2000
set autoread
set wildmenu

" Use Short updatetime to have less delay
set updatetime=50

" Don't pass messages to ins-completion-menu
set shortmess+=c

" There's no need to do syntax highlighting past this many columns. The default
" of 3000 is a bit and degrades performance.
set synmaxcol=1000

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Paths for fuzzy find
set path +=**
set path +=$PWD/

" Open new split panes to right and bottom, feels more natural
set splitbelow
set splitright

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
set timeout
set timeoutlen=300
