#include <stdio.h>

int main(int argc, char const *argv[])
{
  char input_string[20];

  printf("Please enter a long string.\n>");
  fgets(input_string, 20, stdin);

  printf("You enter a very long string: [%s]\n", input_string);

  return 0;
}
