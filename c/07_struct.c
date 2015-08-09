#include <stdio.h>
#include <string.h>

struct people {
  char *name;
  int age;
};

int main(int argc, char const *argv[])
{

  struct people qiuyuanxin;

  qiuyuanxin.name = strdup("德玛西亚");
  qiuyuanxin.age = 24;

  printf("qiuyuanxin.name = %s\n", qiuyuanxin.name);
  printf("qiuyuanxin.age  = %d\n", qiuyuanxin.age);
  
  return 0;
};
