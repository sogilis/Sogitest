
@test "ajout d'un 0 pour 5 bits valant 1" {
    run bash -c "echo 11111 | ./bin/encoder"
    echo $output
    [ "$status" -eq 0 ]
    [ "$output" = "111110" ]
}

@test "ajout d'un 1 pour 5 bits valant 0" {
    run bash -c "echo 00000 | ./bin/encoder"
    [ "$status" -eq 0 ]
    [ "$output" = "000001" ]
}

@test "caracteres non 0 ou 1 ignores" {
    run bash -c "echo 11a110 | ./bin/encoder"
    [ "$status" -eq 0 ]
    [ "$output" = "11110" ]
}

@test "traitement d'une chaine complexe" {
    run bash -c "echo 11111000011111000 | ./bin/encoder"
    [ "$status" -eq 0 ]
    [ "$output" = "1111100000111110000" ]
}

@test "traitement d'un fichier" {
    run bash -c "cat test/input.txt | ./bin/encoder"
    [ "$status" -eq 0 ]
    [ "$output" = `cat test/output.txt` ]
}
