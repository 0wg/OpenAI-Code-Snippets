#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
  srand(time(0)); // Seed the random number generator

  int user_choice, computer_choice;
  printf("Enter 1 for rock, 2 for paper, or 3 for scissors: ");
  scanf("%d", &user_choice);

  // Generate a random number between 1 and 3 for the computer's choice
  computer_choice = rand() % 3 + 1;

  if (user_choice == 1) {
    // User chose rock
    if (computer_choice == 1) {
      // Computer chose rock
      printf("Tie! Both players chose rock.\n");
    } else if (computer_choice == 2) {
      // Computer chose paper
      printf("You lose! Paper beats rock.\n");
    } else {
      // Computer chose scissors
      printf("You win! Rock beats scissors.\n");
    }
  } else if (user_choice == 2) {
    // User chose paper
    if (computer_choice == 1) {
      // Computer chose rock
      printf("You win! Paper beats rock.\n");
    } else if (computer_choice == 2) {
      // Computer chose paper
      printf("Tie! Both players chose paper.\n");
    } else {
      // Computer chose scissors
      printf("You lose! Scissors beats paper.\n");
    }
  } else if (user_choice == 3) {
    // User chose scissors
    if (computer_choice == 1) {
      // Computer chose rock
      printf("You lose! Rock beats scissors.\n");
    } else if (computer_choice == 2) {
      // Computer chose paper
      printf("You win! Scissors beats paper.\n");
    } else {
      // Computer chose scissors
      printf("Tie! Both players chose scissors.\n");
    }
  } else {
    printf("Invalid choice.\n");
  }

  return 0;
}
