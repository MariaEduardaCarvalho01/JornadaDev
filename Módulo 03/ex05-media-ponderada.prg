FUNCTION Main()

    LOCAL cEntrada
    LOCAL nNotaA
    LOCAL nNotaB
    LOCAL nNotaC
    LOCAL nNotaD
    LOCAL nMedia

    ACCEPT "Insira a 1º nota: " TO cEntrada
    nNotaA := Val(cEntrada)

    ACCEPT "Insira a 2ª nota: " TO cEntrada
    nNotaB := Val(cEntrada)

    ACCEPT "Insira a 3ª nota: " TO cEntrada
    nNotaC :=Val(cEntrada)

    ACCEPT "Insira a 4ª nota: " TO cEntrada
    nNotaD := Val(cEntrada)

    nMedia:= (nNotaA *1 + nNotaB * 2 + nNotaC * 3 + nNotaD *4) / 10

    QOut("A média ponderada é: " + Str(nMedia, 10, 2))

RETURN NIL
