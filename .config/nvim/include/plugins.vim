" Auto Install vimplug if it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
" Telescope Stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Gruvbox Baby
Plug 'gruvbox-community/gruvbox'

" Better (experimental) syntax hightlighting and goodies
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" It's tpope ...
" TL;DR gcc to comment (takes a count)
" Can also use it with verbs gcap
Plug 'tpope/vim-commentary'

" cs: change surround
" ds: delete surround
Plug 'tpope/vim-surround'

" Make tpopes plugins dot (.) repeatable
Plug 'tpope/vim-repeat'

" Incrementing done right
Plug 'tpope/vim-speeddating'

" ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious.
" [<Space> and ]<Space> newlines before and after the cursor line. 
" [e and ]e exchange the current line with the one above or below it.
" [os, ]os, yos perform :set spell, :set nospell, :set invspell. 
" There's also l (list), n (number), w (wrap), x (cursorline cursorcolumn), and several others, plus mappings to help alleviate the set paste dance
" [x and ]x encode and decode XML (and HTML). 
" [u and ]u encode and decode URLs. 
" [y and ]y do C String style escaping.
" [f and ]f to go to the next/previous file in the directory, 
" [n and ]n to jump between SCM conflict markers. 
Plug 'tpope/vim-unimpaired'

" Shhh It's illegal
Plug 'tpope/vim-fugitive'

" Try out a status line why not
Plug 'vim-airline/vim-airline'

" Stuff from the E ~editor~ OS don't judge me
Plug 'tpope/vim-rsi'
Plug 'mbbill/undotree'

" Language servers
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Preview Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mfussenegger/nvim-dap'

Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
call plug#end()

" Telescope
" <C-n>/<Down> 	Next item
" <C-p>/<Up> 	Previous item
" j/k 	Next/previous (in normal mode)
" <CR> 	Confirm selection
" <C-x> 	go to file selection as a split
" <C-v> 	go to file selection as a vsplit
" <C-t> 	go to a file in a new tab
" <C-u> 	scroll up in preview window
" <C-d> 	scroll down in preview window
" <C-c> 	close telescope
" <Esc> 	close telescope (in normal mode)
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" netrw: Configuration
" ====================
let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" hide dotfiles by default (this is the string toggled by netrw-gh)
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25

" Disable meta shortcut in Vim RSI
let g:rsi_no_meta = 1

" Fugitive maps
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gp :Git push<CR>

" Completion Nvim
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Remove the annoying popup
let g:completion_enable_auto_popup = 0
imap <silent> <c-n> <Plug>(completion_trigger)

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" Tree Sitter options, Just using Python right now so enabling all is safe
lua <<EOF
require'nvim-treesitter.configs'.setup {
-- Modules and its options go here
highlight = { enable = true },
incremental_selection = { enable = true },
textobjects = { enable = true },
}
EOF

" Markdown Previewer

" Open the preview window after entering the markdown buffer
let g:mkdp_auto_start = 1

" Auto close current preview window when change from markdown buffer to another buffer
let g:mkdp_auto_close = 1

" Disable refresh markdown when save the buffer or leave from insert mode
let g:mkdp_refresh_slow = 0

" MarkdownPreview command can be used only in markdown file
let g:mkdp_command_for_global = 0

" Make the preview server unavailable to others in your network (127.0.0.1)
let g:mkdp_open_to_the_world = 0

" Use a custom IP to open preview page https://github.com/iamcco/markdown-preview.nvim/pull/9
let g:mkdp_open_ip = ''

" Specify browser to open preview page
let g:mkdp_browser = 'chromium-browser'

" Disable echo preview page url in command line when open preview page
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page this function will receive url as param
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" No custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" No custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" Use a custom random port to start server
let g:mkdp_port = ''

" preview page title
let g:mkdp_page_title = '「${name}」'

" recognized filetypes these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

