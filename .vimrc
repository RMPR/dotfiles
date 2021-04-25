set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256

"""""""
" Vanilla Config RMPR
"""""""
colorscheme ron

if has("autocmd")
  filetype indent plugin on
endif

"set spelllang=en_us,fr
"set spell
set history=2000
set nocompatible
set relativenumber
set ignorecase
set smartcase
syntax on
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set encoding=utf-8
set guifont=consolas

" Show linenumbers
set number
set ruler

" Enable the match-it plugin to enhance %
runtime macros/matchit.vim

" Set Proper Tabs
set smarttab
set expandtab
set smartindent
set colorcolumn=80

" Always display the status line
set laststatus=2

" Enable Elite mode, No arrows
let g:elite_mode=1

let mapleader = " "

"
" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" syntax marking for python (may not work)
let python_highlight_all=1
set tabstop=4 softtabstop=4

" move indent when enter is pressed
set autoindent

" show matching brackets
set showmatch

" searching
set incsearch
set hlsearch

" remove vertical fill characters in splits
set fillchars+=vert:\  

" Switch to a buffer without saving the previous one
set hidden

" key binding to turn off search highlighting
nnoremap <esc><esc> :silent! nohls<cr>

" Manage vim and system clipboard under Wayland
"xnoremap "+y y:call system("wl-copy", @")<cr>
"nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
"nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Paths for fuzzy find
set path +=**
set path +=$PWD/

" display all matching files
set wildmenu

" Move more easily between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Paste after
map ]p o<Esc>p

" number line and fold line background conf
hi LineNr guibg=bg
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

" Create a directory if it doesn't exist yet
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" Create a new file under the cursor if it doesn't already exist
noremap <leader>gf :e <cfile><cr>

" Save session 
nnoremap <leader>ss :mksession!<CR> 
" Reload session 
nnoremap <leader>sl :so Session.vim<CR>


" {{{ netrw: Configuration
"     ====================
let g:netrw_browsex_viewer="setsid xdg-open"
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" hide dotfiles by default (this is the string toggled by netrw-gh)
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25

set foldmethod=indent
set foldlevel=99
" Set PEP 8 proper formatting
" indentation-based folding
set foldmethod=indent
set foldlevel=99

" Snippets
" --------
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>/title<CR>cit
nnoremap ,koa :-1read $HOME/.vim/.skeleton.koa<CR>/Hello, World<CR>ci'
nnoremap ,c :-1read $HOME/.vim/.skeleton.c<CR>/Hello, World<CR>ci'
nnoremap ,sh :-1read $HOME/.vim/.skeleton.sh<CR>A
nnoremap ,md :-1read $HOME/.vim/.skeleton.md<CR>jf"ci"
nnoremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>6j_

" C Programming
" -------------

set cindent shiftwidth=4

" Set Project-specific vimrc
" --------------------------
set exrc
set secure

