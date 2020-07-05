
call plug#begin()
Plug 'davidhalter/jedi-vim'
Plug 'dracula/vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
call plug#end()
" Vanilla
"
" -----------------------------------------------------------------------
set inccommand=nosplit
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Open the built-in terminal if not launched from a Terminal
map <C-z> :split term://zsh <CR> A
tnoremap <ESC> <C-\><C-n>

" -----------------------------------------------------------------------


" Plugin specific ------------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif
let g:deoplete#enable_at_startup = 1
syntax enable
colorscheme dracula
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
" -----------------------------------------------------------------------

