" Move more easily between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-left>  :wincmd <<cr>
map <C-right> :wincmd ><cr>
map <C-up>    :wincmd +<cr>
map <C-down>  :wincmd -<cr>

" Hitting escape twice should clear any search highlights.
noremap <ESC><ESC> :nohlsearch<CR>

" Reload Nvim
noremap <F5> :source ~/.config/nvim/init.vim<CR>

" Snippets
" --------
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>/title<CR>cit
nnoremap ,koa :-1read $HOME/.vim/.skeleton.koa<CR>/Hello, World<CR>ci'
nnoremap ,c :-1read $HOME/.vim/.skeleton.c<CR>/Hello, World<CR>ci'
nnoremap ,sh :-1read $HOME/.vim/.skeleton.sh<CR>A
nnoremap ,md :-1read $HOME/.vim/.skeleton.md<CR>jf"ci"
nnoremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>6j_
