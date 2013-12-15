"----------------------------------------
" uncrustify
"----------------------------------------
" see http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829

" Restore cursor position, window position, and last search after running a
" command.
function! uncrustify#PreserveCursorPos(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! uncrustify#Uncrustify(language)
    if executable("uncrustify")
        call uncrustify#PreserveCursorPos(':silent %!uncrustify'.' -q '.' -l '.a:language.' -c '.
                    \shellescape(fnamemodify(g:uncrustify_cfg_file_path, ':p')))
    else
        echomsg "uncrustify is not on your path?"
    endif
endfunction

function! uncrustify#UncrustifyAuto()
    let s:uncrustify_lang = &filetype
    call uncrustify#Uncrustify(s:uncrustify_lang)
endfunction
