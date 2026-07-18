// Exercício 2 

PROCEDURE Main()

    Local nValor := 0
    Local cValor := ""

    ?"Insira um valor inteiro (0 ou negativo para sair):"
    ACCEPT "Valor: " TO cValor
    nValor := Val(cValor)

    WHILE nValor > 0
        ? "Dobro de " + Str(nValor) + " = " + Str(nValor * 2)
        ?"Insira outro Valor inteiro (O ou negativo para sair):"
        ACCEPT "Valor: " TO cValor
        nValor := Val(cValor)
    ENDDO

    ?"Precione qualquer tecla para sair."
    Inkey(0)

RETURN
