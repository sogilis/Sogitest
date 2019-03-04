# Bit stuffing

## Contexte

Ton client est un fabricant de disques durs qui souhaite prototyper un nouveau mécanisme de stockage des données sur le disque dur.

La tête de lecture d'un disque dur est un élément mécanique, ce qui entraîne une imprécision sur la lecture. Afin de pallier à ce problème, la tête de lecture se synchronise sur les changements d'état des bits stockés sur le disque magnétique. Il reste un problème : si on stocke sur le disque dur une longue séquence de données sans transitions, la tête de lecture risque de se décaller assez pour qu'on lise un nombre de bits différents du nombre de bits écrits.

Une solution simple pour pallier à ce problème consiste à encoder les données avant de les stocker sur le disque, pour forcer les données à effectuer une transition si une chaine de bits de même valeur est détectée. L'algorithme naif utilisé ici est le suivant :

**Tous les 5 bits de même valeurs, insérer un bit de la valeur opposée.**

Exemple : la chaîne **11111** devient **111110** une fois encodée.

## Travail demandé

Avant de concevoir l'électronique, on veut prototyper logiciellement cet encodeur. Le client demande un encodeur qui lit les bits sur son entrée standard sous forme de chaîne de caractères :

- '0' pour un bit zéro
- '1' pour un bit un
- Les autres caractères sont ignorés

L'encodeur doit sortir le résultat sur sa sortie standard suivant la même convention.

L'encodeur fonctionne en mode stream. Pour simplifier le problème on peut lire un octet à la fois.

Voici un exemple d'utilisation de cet encodeur :
    
    candidat@debian-sogilis:~$ echo 11111 | ./encoder
    111110

## Exigences

- Propreté du code
- Propreté des méthodes de développement (Makefile, dépôt git, documentation)
- Capacité à montrer que le code est fonctionnel (tests)
