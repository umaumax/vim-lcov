# vim-lcov

vim plugin to show uncovered coverage lines by lcov info file

## requires
* python3

## how to use
``` vim
:LcovVisible <filepath of .info file>
```

If you set `VIM_LCOV_INFO_FILEPATH` environment variable, this plugin load info file automatically.
``` bash
export VIM_LCOV_INFO_FILEPATH=coverage.info
vim main.cpp
```

## how to customize settings
``` vim
# default value
let g:vim_lcov_marker_covered = '✓'
let g:vim_lcov_marker_uncovered = '✘'
let g:vim_lcov_marker_fold = 1

# default value
highlight VimLcovCoveredLineSignText   ctermbg=232 ctermfg=82  guibg=232 guifg=82
highlight VimLcovUncoveredLineSignText ctermbg=232 ctermfg=197 guibg=232 guifg=197
```
