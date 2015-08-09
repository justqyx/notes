#include <stdio.h>

int multi(int x, int y);

int main(int argc, char const *argv[])
{
  int x;
  int y;

  printf("Please input two numbers to be multiplied.\n");

  printf("input x = ");
  scanf("%d", &x);

  printf("input y = ");
  scanf("%d", &y);

  printf("x * y = %d * %d = %d\n", x, y, multi(x,y));

  return 0;
}

int multi(int x, int y)
{
  return x * y;
}
