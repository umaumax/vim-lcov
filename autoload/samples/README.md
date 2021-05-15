# examples
## how to generate info file
``` bash
rm -f *.gcda *.gcno
g++ -coverage -o main main.cpp
# generate main.gcda
./main
# generate main.info
lcov -c -b . -d . -o main.info

# other pattern
./main hello
lcov -c -b . -d . -o main_other_pattern.info
```
