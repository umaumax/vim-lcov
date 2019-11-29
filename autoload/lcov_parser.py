#!/usr/bin/env python3
import os
import re

LCOV_SF_RE = re.compile(r'^SF:(.*)$')
LCOV_DA_RE = re.compile(r'^DA:([0-9]+),([0-9]+)$')

# SF:/xxx/yyy/main.cpp
# DA:11,0


def uncovered_line_numbers_generator(info_filepath, source_filepath):
    # NOTE: dummy filepath
    filename = ''
    for line in open(info_filepath):
        line = line.rstrip(os.linesep)
        m = LCOV_SF_RE.match(line)
        if m:
            filename, = m.groups()
        if not filename:
            continue
        if filename.endswith(
                source_filepath) or source_filepath.endswith(filename):
            pass
        else:
            filename = ''
            continue
        if line == 'end_of_record':
            break
        m = LCOV_DA_RE.match(line)
        if m:
            line, count = m.groups()
            if int(count) == 0:
                yield int(line)


"""
def main():
    for i, line in enumerate(
            uncovered_line_numbers_generator('samples/main.info', 'samples/main.cpp'), start=1):
        print(i, line)


if __name__ == '__main__':
    main()
"""
