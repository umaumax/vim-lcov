# vim-lcov

vim plugin to show uncovered coverage lins by lcov info file

## requires
* python3

## how to use
```
:LcovVisible <filepath of .info file>
```

If you set `VIM_LCOV_INFO_FILEPATH` environment variable, this plugin load info file automatically.
```
export VIM_LCOV_INFO_FILEPATH=coverage.info
vim main.cpp
```

## FMI
* [shaneharper/vim\-gcov: VIM plugin to show executed statements of C/C\+\+ programs\.]( https://github.com/shaneharper/vim-gcov )
* [Pythonでvim pluginを書く \- Qiita]( https://qiita.com/zakuro9715/items/98449dd4c6b9e1d61ef5 )
* [sign \- Vim日本語ドキュメント]( https://vim-jp.org/vimdoc-ja/sign.html )
