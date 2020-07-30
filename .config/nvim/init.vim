call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'vim-utils/vim-man'
Plug 'dracula/vim'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Vanilla
" -----------------------------------------------------------------------
set inccommand=nosplit
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if executable('rg')
    let g:rg_drive_root='true'
endif

" Open the built-in terminal if not launched from a Terminal
map <C-z> :split term://zsh <CR> A
tnoremap <ESC> <C-\><C-n>

" -----------------------------------------------------------------------

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>/ :Rg<SPACE>

nnoremap <leader>gs :G<CR>
nnoremap <Leader>gj :diffget //3<CR>
nnoremap <Leader>gf :diffget //2<CR>
nnoremap <Leader>cc :Gcommit<CR>
nnoremap <Leader>p :Gpush<CR>

nmap <leader>>rr <Plug>(coc-rename)

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Plugin specific ------------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif
colorscheme dracula
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitbelow
set splitright
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" open the go-to function in split, not another buffer
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
" -----------------------------------------------------------------------
"

