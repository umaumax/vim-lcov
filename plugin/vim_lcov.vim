if exists('g:loaded_vim_lcov')
    finish
endif
let g:loaded_vim_lcov = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 -complete=file LcovVisible :call vim_lcov#lcov_uncovered_visible(<f-args>)

function! s:startup() abort
    if $VIM_LCOV_INFO_FILEPATH != ''
        call vim_lcov#lcov_uncovered_visible($VIM_LCOV_INFO_FILEPATH)
    endif
endfunction

augroup vim_lcov_group
    autocmd!
    autocmd FileType c,cpp call s:startup()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
