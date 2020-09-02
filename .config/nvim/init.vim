call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'dracula/vim'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
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

set splitbelow
set splitright

" -----------------------------------------------------------------------
"  FZF
" -----------------------------------------------------------------------
nnoremap <Leader>f :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>/ :Rg<SPACE>
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

"-------------------------------------------------------------------------
" FUGITIVE CONFIGS 
"-------------------------------------------------------------------------
nnoremap <leader>gs :G<CR>
nnoremap <Leader>gj :diffget //3<CR>
nnoremap <Leader>gf :diffget //2<CR>
nnoremap <Leader>cc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gs :Gstatus<CR>

nmap <leader>rr <Plug>(coc-rename)

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>gc :GCheckout<CR>
nnoremap <Leader>gd :<C-u>call CocActionAsync('jumpDefinition')<CR> 

" Plugin specific ------------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif
colorscheme dracula
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" open the go-to function in split, not another buffer
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)
" -----------------------------------------------------------------------
"

