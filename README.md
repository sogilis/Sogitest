# Sogitest : Bit Stuffing

Enoncé : [bit stuffing](exercice.md)

# Installation

## Dépendances

- BATS pour les tests, voir [README](https://github.com/bats-core/bats-core) pour installation ;
- Doxygen pour la génération de la documentation, voir [Manuel](http://doxygen.nl/manual/install.html) pour installation.

# Compilation

La compilation se fait grâce à [make](https://www.gnu.org/software/make).

    make

# Test

[5 tests](test/tests.bats) sont exécutés.

    make test

# Doc

La doc générée est sous format html, on peut la trouver dans le dossier doc.

    make doc
