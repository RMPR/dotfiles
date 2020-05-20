set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

"""""""
" Vanilla Config RMPR
"""""""


set nocompatible
set smartcase
syntax on
set nowrap
set encoding=utf-8
set guifont=consolas

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, No arrows
let g:elite_mode=1

"
" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize -2<CR>
	nnoremap <Right> :vertical resize +2<CR>
endif

colorscheme ron

" indentation-based folding
set foldmethod=indent
set foldlevel=99

" syntax marking for python (may not work)
let python_highlight_all=1

" move indent when enter is pressed
set autoindent

" show matching brackets
set showmatch

" searching
set incsearch
set hlsearch

" remove vertical fill characters in splits
set fillchars+=vert:\  

" key binding to turn off search highlighting
nnoremap <esc><esc> :silent! nohls<cr>

" Manage vim and system clipboard under Wayland
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" Path for fuzzy find
set path +=**
set path +=$PWD/

" display all matching files
set wildmenu

" Make the terminal behave like a normal split
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" set working directory to wherever the open file lives
set autochdir

" number line and fold line background conf
hi LineNr guibg=bg
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" Python programming Specific additions
" -------------------------------------
" Set folding
set foldmethod=indent
set foldlevel=99
" Set PEP 8 proper formatting
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Flag unecessary white space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Web Development
" ---------------
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

