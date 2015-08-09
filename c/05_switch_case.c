#include <stdio.h>

void load_game();
void play_game();
void play_multi_player();

int main(int argc, char const *argv[])
{
  int input_value;

  printf("1. Play game\n");
  printf("2. Load game\n");
  printf("3. Play multiple player\n");
  printf("4. Exit\n");

  printf("Selection > ");
  scanf("%d", &input_value);

  switch (input_value) {
    case 1:
      play_game();
      break;
    case 2:
      load_game();
      break;
    case 3:
      play_multi_player();
      break;
    case 4:
      printf("Thanks for playing!\n");
      break;
    default:
      printf("Bad input, quitting!\n");
      break;
  }

  getchar();

  return 0;
}

void load_game() 
{
  printf("Load game called.\n");
}

void play_game()
{
  printf("Play game called.\n");
}

void play_multi_player()
{
  printf("Play multiplayer game called.\n");
}
