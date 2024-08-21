" Aute Install vimplug if it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
" Telescope Stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'

" Gruvbox Baby
Plug 'gruvbox-community/gruvbox'

" Better (experimental) syntax hightlighting and goodies
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" cs: change surround
" ds: delete surround
Plug 'kylechui/nvim-surround'

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
" If fugitive is the git, then rhubarb is the hub
Plug 'tpope/vim-rhubarb'

" Try out a status line why not
Plug 'vim-airline/vim-airline'

" Stuff from the E ~editor~ OS don't judge me
Plug 'tpope/vim-rsi'
Plug 'mbbill/undotree'

" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'

Plug 'michaelb/sniprun', {'do': 'bash install.sh'}

" Replace tpope gcc (comment line), gcb (comment block) can take a motion also
Plug 'numToStr/Comment.nvim'

Plug 'kdheepak/lazygit.nvim'

" Sticky header
Plug 'nvim-treesitter/nvim-treesitter-context'
" Vim Script
Plug 'folke/which-key.nvim'
Plug 'voldikss/vim-floaterm'

Plug 'pwntester/octo.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'bennypowers/nvim-regexplainer'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'KabbAmine/zeavim.vim'
Plug 'github/copilot.vim'
Plug 'sourcegraph/sg.nvim', { 'do': 'nvim -l build/init.lua' }

Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

lua << EOF
require"octo".setup()
EOF

lua << EOF
require'regexplainer'.setup {
  -- 'narrative'
  mode = 'narrative', -- TODO: 'ascii', 'graphical'

  -- automatically show the explainer when the cursor enters a regexp
  auto = false,

  -- filetypes (i.e. extensions) in which to run the autocommand
  filetypes = {
    'html',
    'js',
    'cjs',
    'mjs',
    'ts',
    'jsx',
    'py',
    'tsx',
    'cjsx',
    'mjsx',
  },

  -- Whether to log debug messages
  debug = false, 

  -- 'split', 'popup'
  display = 'popup',

  mappings = {
    toggle = 'gR',
    -- examples, not defaults:
    -- show = 'gS',
    -- hide = 'gH',
    -- show_split = 'gP',
    -- show_popup = 'gU',
  },

  narrative = {
    separator = '\n',
  },
}
EOF

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
nnoremap <leader>gf :Git fetch<CR>
nnoremap <leader>gF :Git pull<CR>
nnoremap <leader>gfa :Git fetch --all<CR>
nnoremap <leader>gb :Git branch 
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gr :Git rebase 
nnoremap <leader>gbl :Git blame<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gP :Git push<CR>
nmap <leader>gPf :Git push --force<CR>
nmap <leader>gco :Git checkout 
nmap <leader>gco- :Git checkout -<CR>
nmap <leader>gca :Git commit --amend<CR>
nmap <leader>gX :Git reset 
nmap <leader>gXh :Git reset --hard HEAD~1
nmap <leader>gXs :Git reset --soft HEAD~1

nnoremap <Leader>gy :.GBrowse!<CR>
xnoremap <Leader>gy :'<'>GBrowse!<CR>

" Git Worktree config
lua require('git-worktree').setup()
lua require('telescope').load_extension('git_worktree')
nnoremap <leader>gwtc :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>gwtl ::lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

" Completion Nvim
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Remove the annoying popup
let g:completion_enable_auto_popup = 0

" Sniprun configuration
vmap m<CR> <Plug>SnipRun
nnoremap m<Space> :%SnipRun<Space>

lua require('Comment').setup()
lua require('nvim-surround').setup()
lua require('which-key').setup()
lua require('ibl').setup()
