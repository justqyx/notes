#include <stdio.h>

int main(int argc, char const *argv[])
{
  int age;

  printf("Please enter your age:");
  scanf("%d", &age);

  if (age < 100) {
    printf("You are pretty yound!\n");
  } else if (age == 100) {
    printf("You are old!\n");
  } else {
    printf("You are really old\n");
  }

  return 0;
}
