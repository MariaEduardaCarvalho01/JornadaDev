FUNCTION Main()

    LOCAL nNumero1 := 0
    LOCAL nNumero2 := 0

    INPUT("Insira o primeiro número: ") TO nNumero1
    INPUT("Insira o segundo número: ") TO nNumero2

    IF nNumero1 == nNumero2
        QOut("Os números são iguais")
        QOut("Número 1: " + AllTrim(Str(nNumero1)))
        QOut("Númmero 2: " + AllTrim(Str(nNumero2)))
    
    ELSEIF nNumero1 > nNumero2
        QOut("O 1º número é o maior: " + AllTrim(Str(nNumero1)))
        QOut("O 2º número é o menor: " + AllTrim(Str(nNumero2)))
    
    ELSE
        QOut("O 2º número é o maior: " + AllTrim(Str(nNumero2)))
        QOut("O 1º número é o menor: " + AllTrim(Str(nNumero1)))

    ENDIF

RETURN NIL
