" Auto enter insert mode when opening the terminal
" autocmd TermOpen * startinsert
augroup insertonenter
    function! InsertOnTerminal()
        if &buftype ==# "terminal"
            normal i
        endif
    endfunction

    autocmd! BufEnter * call InsertOnTerminal()
    if has('nvim')
        autocmd! TermOpen * call InsertOnTerminal()
    endif
augroup END

augroup NumberInsertModeOnly
    autocmd!
    autocmd InsertEnter * setlocal norelativenumber
    autocmd InsertLeave * setlocal relativenumber
augroup END
