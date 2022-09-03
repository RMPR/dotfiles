" Move more easily between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Even in the terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-^> <C-\><C-n><C-^>

map <C-left>  :wincmd <<cr>
map <C-right> :wincmd ><cr>
map <C-up>    :wincmd +<cr>
map <C-down>  :wincmd -<cr>

" Hitting escape twice should clear any search highlights.
noremap <ESC><ESC> :nohlsearch<CR>

" Reload Nvim Config
noremap <leader><leader>s :source ~/.config/nvim/init.vim<CR>

" Emacs muscle memory
map <C-x><C-s> :w<CR>
map <C-x><C-c> :wq<CR>

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" Paths for fuzzy find
set path +=**
set path +=$PWD/

" Create a new file under the cursor if it doesn't already exist
noremap <leader>gf :e <cfile><cr>

" Save session
nnoremap <leader>ss :mksession!<CR>
" Reload session
nnoremap <leader>sl :source Session.vim<CR>

" Make * and # search the visual selection, thanks Drew
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V'.substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

nnoremap <C-z> :terminal fish<CR>
" List available buffers and prepare :b to switch with numbers
nnoremap <Leader>b :ls<CR>:b<Space>

" Search in a range hightlighted in visual mode 
vnoremap <Leader>/ <Esc>/\%V

" Reopen closed split (kinda)
nnoremap <C-S><C-W> :vs#<CR>

" I use <C-j> in ranger to invoke autojump, make it consistent in nvim
" map <leader>cj :!j 

" Snippets
" --------
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>/title<CR>cit
nnoremap ,koa :-1read $HOME/.vim/.skeleton.koa<CR>/Hello, World<CR>ci'
nnoremap ,c :-1read $HOME/.vim/.skeleton.c<CR>/Hello, World<CR>ci'
nnoremap ,sh :-1read $HOME/.vim/.skeleton.sh<CR>A
nnoremap ,md :-1read $HOME/.vim/.skeleton.md<CR>jf"ci"
nnoremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>6j_
