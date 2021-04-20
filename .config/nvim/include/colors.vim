let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="soft"
colorscheme gruvbox

" Toggle between light and dark mode
nnoremap <F12> :let &bg= &bg == "dark" ? "light" : "dark"<CR>
