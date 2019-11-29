#!/usr/bin/env python3

import vim
import os
import lcov_parser


def vim_lcov_highlight_uncovered_lines(lcov_filepath):
    eof_line_number = int(vim.eval("line('$')"))

    def create_fold_if_needed(last_line_number, line_number):
        start_line = last_line_number + 1
        end_line = line_number
        if start_line > eof_line_number or end_line > eof_line_number:
            print(
                "[vim-lcov][WARN] no such line range {}~{}".format(start_line, end_line))
            return False
        if end_line > start_line + 1:
            vim.command(':' + str(start_line) +
                        ',' + str(end_line) + 'fold')
        return True

    if not os.path.isfile(lcov_filepath):
        print("[vim-lcov][ERROR] no such file {}".format(lcov_filepath))
        return False
    last_line_number = 0
    # NOTE: sign id must be number > 0 and uniq in some group
    sign_id_start = 1
    group = 'vim-lcov_' + vim.current.buffer.name
    priority = 9999  # NOTE: default value is 10
    for sign_id, line_number in enumerate(
        lcov_parser.uncovered_line_numbers_generator(
            lcov_filepath, os.path.basename(vim.current.buffer.name)), start=sign_id_start):
        vim.command(
            'exe ":sign place ' +
            str(sign_id) +
            ' line=' +
            str(line_number) +
            ' group=' + group +
            ' priority=' + str(priority) +
            ' name=vim_lcov_uncovered file=".expand("%:p")')
        create_fold_if_needed(last_line_number, line_number - 1)
        last_line_number = line_number

    create_fold_if_needed(last_line_number, eof_line_number)
    return True
