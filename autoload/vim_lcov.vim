if !exists('g:loaded_vim_lcov')
  finish
endif
let g:loaded_vim_lcov = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists("g:vim_lcov_marker_covered")
  let g:vim_lcov_marker_covered = '✓'
endif
if !exists("g:vim_lcov_marker_uncovered")
  let g:vim_lcov_marker_uncovered = '✘'
endif
if !exists("g:vim_lcov_marker_fold")
  let g:vim_lcov_marker_fold = 1
endif

if !hlexists('VimLcovCoveredLineSignText')
  " green on black
  highlight VimLcovCoveredLineSignText   ctermbg=232 ctermfg=82  guibg=232 guifg=82
endif
if !hlexists('VimLcovUncoveredLineSignText')
  " red on black
  highlight VimLcovUncoveredLineSignText ctermbg=232 ctermfg=197 guibg=232 guifg=197
endif

" NOTE
" linehl can also be specified when defining a sign to highlight entire line,
" however, other syntax highlighting will then not be applied to the line.
execute 'sign define vim_lcov_covered text='.g:vim_lcov_marker_covered  .' texthl=VimLcovCoveredLineSignText'
execute 'sign define vim_lcov_uncovered text='.g:vim_lcov_marker_uncovered.' texthl=VimLcovUncoveredLineSignText'

let s:this_plugin_directory = escape(expand('<sfile>:p:h'), '\"')
execute 'python3 import sys; sys.path += ["' . s:this_plugin_directory . '"]'
py3file <sfile>:p:h/vim_bridge.py
py3file <sfile>:p:h/lcov_parser.py

function! vim_lcov#lcov_uncovered_visible(lcov_filepath)
  setlocal foldmethod=manual
  python3 vim_lcov_highlight_uncovered_lines(vim.eval('a:lcov_filepath'))
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
