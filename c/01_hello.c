// 编译
// clang -o output/hello hello.c

#include <stdio.h>

int main(int argc, char const *argv[])
{
  printf("Hello World\n");
  printf("Number of arguments: [%d]. And it's [%s]\n", argc, argv[0]);
  return 0;
}
