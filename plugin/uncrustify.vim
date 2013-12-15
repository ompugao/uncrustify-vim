if exists('g:loaded_uncrustify_vim')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

command! Uncrustify :call uncrustify#UncrustifyAuto()
" autocmd BufWritePre <buffer> :call uncrustify#UncrustifyAuto()

if !has_key(g:, "uncrustify_cfg_file_path")
  let g:uncrustify_cfg_file_path = "~/.uncrustify.cfg"
endif

let g:loaded_uncrustify_vim = 1

let &cpo = s:save_cpo
unlet s:save_cpo
