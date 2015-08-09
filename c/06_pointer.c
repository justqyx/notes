#include <stdio.h>

int main(int argc, char const *argv[])
{
  int x;
  int *p;

  printf("x = ");
  scanf("%d", &x);

  p = &x;

  printf("You just input x = %d\n", *p);

  printf("bit length of int: %lu\n", sizeof(int));
  printf("bit length of p pointer: %lu\n", sizeof(p));
  printf("bit length of the value of p pointer: %lu\n", sizeof(*p));

  return 0;
};
