#include <stdio.h>

int main(int argc, char const *argv[])
{
  int x;

  for (x = 0; x < 10; x++)
  {
    printf("当前 x 的值：%d\n", x);
  }

  printf("================\n");

  int y = 0;

  while ( y < 10) {
    printf("当前 y 的值：%d\n", y);

    y++;

    if ( y > 5) {
      continue;
    }
  }

  printf("================\n");

  int z = 0;

  do {
    printf("当前 z 的值：%d\n", z);

    z++;

    if (z > 5) {
      break;
    }
  } while ( z < 10);

  printf("================\n");
  printf("输入回车键结束 >");

  getchar();

  return 0;
}
