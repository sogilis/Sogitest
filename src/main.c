/**
 * @brief bit stuffing
 * @details lit des 0 ou 1 sur l'entrée standard, applique un bit stuffing et écrit
 * le résultat sur la sortie standard.
 * Le bit stuffing consiste en l'ajout d'un bit de valeur opposé, après 5 bits de
 * même valeur.
 *
 * @param argc non-utilisé
 * @param argv non-utilisé
 *
 * @return toujours 0
 */

#include <stdio.h>


int main(int argc, char const *argv[])
{
    /*
    c      caractère courant
    last   caractère précédent
    count  nombre de bits consécutifs de même signe
    */
    char c = 0, last = 0, count = 0;

    c = getchar();

    while (c != EOF && c != '\n') {

        // Si le caractère entrant n'est pas 0 ou 1, on récupère un nouveau
        // caractère et on recommence la boucle
        if (c != '0' && c != '1') {
            c = getchar();
            continue;
        }

        // On écrit le caractère courant sur la sortie standard
        putchar(c);

        // Première itération, transition ou 5 bits consécutifs de même signe à
        // l'itération précédente
        if (c != last || count == 0)
            count = 1;

        // Absence de transition
        else {
            count ++;

            // 5 bits consécutifs de même signe
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