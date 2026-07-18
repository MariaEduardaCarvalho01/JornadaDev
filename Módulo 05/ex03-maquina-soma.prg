// Exercício 3
PROCEDURE Main()

    LOCAL nValor := 0
    LOCAL nTotal := 0
    LOCAL nQtd := 0
    LOCAL cValor := ""

    ?"Insira valores inteiros (0 para calcular e sair):"
    ACCEPT "Valor" TO cValor
    nValor := Val(cValor)

    WHILE nValor != 0
        nTotal += nValor
        nQtd++

        ?"Insira outro valor (0 para calcular e sair):"
        ACCEPT "Valor" TO cValor
        nValor := Val(cValor)  
    ENDDO

    ? "Quantidade de valores somados: " + Str(nQtd)
    ? "Soma total: " + Str(nTotal)

    ? "Pressione qualquer tecla para sair..."
    Inkey(0)

RETURN 
