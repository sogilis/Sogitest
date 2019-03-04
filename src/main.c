/**
 * @brief bit stuffing
 * @details reads 0 or 1 from standard input, applies bit stuffing and writes
 * result on standard output.
 * Bit stuffing consists in adding a bit of opposite value after 5 bits of same
 * value.
 *
 * @param argc not used
 * @param argv not used
 *
 * @return always success (0)
 */

#include <stdio.h>

const char initialChar = 'i';

/*
 * injectBitStuffing allow to inject in the stdout the reverse value of the
 * given bit denoted here by 'c' char
 */
void injectBitStuffing(char byteAsChar) {
  if (byteAsChar == '1') {
    putchar('0');
  } else {
    putchar('1');
  }
}

int main(int argc, char const *argv[]) {
  /*
  c      current char from stdin
  previous   previous char
  count  current count of consecutive bits of same value
  */
  char c = '0', previous = initialChar;
  int count = 0;

  while ((c = getchar()) != EOF && c != '\n') {

    // If current char is not 0 or 1, it skips to next iteration
    if (c != '0' && c != '1') {
      continue;
    }

    // current char is written on stdout
    putchar(c);

    // Transition, reset count, update previous.
    if (c != previous) {
      count = 0;
      previous = c;
      continue;
    }

    count++;

    // 5 consecutive bits of same value
    if (count == 4) {
      injectBitStuffing(c);
      /*
       * This allow to consider the last char of a 5 consecutive bits with
       * same value as different.
       */
      previous = initialChar;
      count = 0;
    }
  }

  return 0;
}
