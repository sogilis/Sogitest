#include <stdio.h>


int main(int argc, char const *argv[])
{
    char c = 0, last = 0, count = 1;

    c = getchar();

    while (c != EOF && c != '\n') {

        if (c == '0' || c == '1') {

            putchar(c);

            if (last == c)
                count ++;

            else
                count = 1;

            if (count == 5) {
                if (c == '0')
                    putchar('1');

                else
                    putchar('0');

                last = 0;
                count = 1;
            }
        }

        last = c;
        c = getchar();
    }

    return 0;
}