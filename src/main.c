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


int main(int argc, char const *argv[])
{
    /*
    c      current char from stdin
    last   last char
    count  current count of consecutive bits of same value
    */
    char c = 0, last = 0, count = 0;

    while ((c = getchar()) != EOF && c != '\n') {

        // If current char is not 0 or 1, it skips to next iteration
        if (c != '0' && c != '1')
            continue;

        // current char is written on stdout
        putchar(c);

        // Transition or null count
        if (c != last || count == 0)
            count = 1;

        // No transition
        else {
            count ++;

            // 5 consecutive bits of same value
            if (count == 5) {
                if (c == '1')
                    putchar('0');
                else
                    putchar('1');

                count = 0;
            }
        }

        last = c;
    }

    return 0;
}