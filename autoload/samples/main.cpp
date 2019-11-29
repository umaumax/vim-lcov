#include <iostream>
#include <string>

std::string switch_test(int x) {
  std::string str;
  switch (x) {
    case 0:
      str = "zero";
      break;
    case 1:
      str = "one"; // PASS_COV
      break;
    case 2:
      str = "two";
      break;
    case 3:
      str = "three";
      break;
    default:
      str = "default";
      break;
  }
  return str;
}

int main(int argc, char* argv[]) {
  switch_test(0);
  switch_test(3);
  if (argc > 1 && std::string(argv[1]) == "hello") {
    std::cout << "hello, world!" << std::endl;
  }
  return 0;
}
