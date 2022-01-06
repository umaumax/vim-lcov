# vim-lcov

vim plugin to show uncovered coverage lines by lcov info file

## requires
* python3

## how to use
```
:LcovVisible <filepath of .info file>
```

If you set `VIM_LCOV_INFO_FILEPATH` environment variable, this plugin load info file automatically.
``` bash
export VIM_LCOV_INFO_FILEPATH=coverage.info
vim main.cpp
```
