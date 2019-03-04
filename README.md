# Sogitest: Bit Stuffing

It is a bit stuffing encoder.

After 5 consecutive '1', it adds a '0' and after 5 consecutive '0' it adds a '1'.

    candidat@debian-sogilis:~$ echo 00111110 | ./bin/encoder
    001111100

Instructions (in french): [bit stuffing](exercice.md)

## Installation

### Dependencies

- [BATS](https://github.com/bats-core/bats-core) for testing

On Ubuntu:

    sudo add-apt-repository ppa:duggan/bats
    sudo apt-get update
    sudo apt-get install bats

On Mac OS X:

    brew install bats-core

## Build

    make

Binary is put in bin/ (automatically created).

## Test

    make test

[5 tests](test/tests.bats) are executed.
