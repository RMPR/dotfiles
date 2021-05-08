let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

" Toggle between light and dark mode
nnoremap <F12> :let &bg= &bg == "dark" ? "light" : "dark"<CR>
