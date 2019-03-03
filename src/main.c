#include <stdio.h>


int main(int argc, char const *argv[])
{
    char c = 0, last = 0, count = 0;

    c = getchar();

    while (c != EOF && c != '\n') {

        // Si le caractère entrant n'est pas 0 ou 1, on récupère un nouveau caractère et on recommence la boucle
        if (c != '0' && c != '1') {
            c = getchar();
            continue;
        }

        // On écrit le caractère courant sur la sortie standard
        putchar(c);

        // Première itération, suite brisée ou suite complétée au tour précédent
        if (c != last || count == 0)
            count = 1;

        // Suite en cours
        else {
            count ++;

            // Suite complète
            if (count == 5) {
                if (c == '1')
                    putchar('0');
                else
                    putchar('1');

                count = 0;
            }
        }

        last = c;

        c = getchar();
    }

    return 0;
}