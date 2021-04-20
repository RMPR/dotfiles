" Install plugins first. We may configure plugins for specific languages later.
runtime! include/plugins.vim
" This is next because it sets language specific variables.
runtime! include/lang.vim

runtime! include/sets.vim
runtime! include/keybinds.vim
runtime! include/colors.vim

" Tree Sitter options, must be put in the init.vim
lua <<EOF
require'nvim-treesitter.configs'.setup {
-- Modules and its options go here
highlight = { enable = true },
incremental_selection = { enable = true },
textobjects = { enable = true },
}
EOF
