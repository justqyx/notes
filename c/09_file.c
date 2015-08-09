#include <stdio.h>
#include <stdlib.h>

static FILE *open_file(char *file, char *mode)
{
  FILE *fp = fopen(file, mode);

  if (fp == NULL){
    perror("Unable to open file");
    exit(EXIT_FAILURE);
  }

  return fp;
}

int main(int argc, char const *argv[])
{
  int ch;

  FILE *in;
  FILE *out;

  if (argc != 3){
    fprintf(stderr, "Usage: %s <readfile1> <writefile2>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  in  = open_file(argv[1], "r");
  out = open_file(argv[2], "w");

  while ( (ch = fgetc(in)) != EOF) {
    fputc(ch, out);
  }

  fclose(in);
  fclose(out);

  return EXIT_SUCCESS;
}
