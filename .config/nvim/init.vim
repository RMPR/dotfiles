" Needs to be set very early
let mapleader = " "
" Install plugins first. We may configure plugins for specific languages later.
runtime! include/plugins.vim
luafile /home/rufus/.config/nvim/after/plugin/telescope.lua
luafile /home/rufus/.config/nvim/after/plugin/treesitter.lua
luafile /home/rufus/.config/nvim/after/plugin/undotree.lua
luafile /home/rufus/.config/nvim/after/plugin/lsp.lua

luafile $XDG_CONFIG_HOME/nvim/lua/dbg/init.lua
" This is next because it sets language specific variables.
"runtime! include/lang.vim

runtime! include/sets.vim
runtime! include/autos.vim
runtime! include/keybinds.vim
runtime! include/colors.vim

