if exists('g:loaded_vim_lcov')
    finish
endif
let g:loaded_vim_lcov = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 -complete=file LcovVisible :call vim_lcov#lcov_uncovered_visible(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo
