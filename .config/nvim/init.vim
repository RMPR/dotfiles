" Needs to be set very early
let mapleader = " "
" Install plugins first. We may configure plugins for specific languages later.
runtime! include/plugins.vim
" This is next because it sets language specific variables.
"runtime! include/lang.vim

runtime! include/sets.vim
runtime! include/keybinds.vim
runtime! include/colors.vim
luafile $XDG_CONFIG_HOME/nvim/lua/lsp_config.lua

