// EXERCÍCIO 10 - MÓDULO 06

FUNCTION Main()

    LOCAL aVetor := {}
    LOCAL nI     := 0
    LOCAL cNum   := ""

// Leitura dos 10 números
    FOR nI := 1 TO 10
        ACCEPT "Digite o " + AllTrim(Str(nI)) + "º numero: " TO cNum
        
// Trata caso o usuário digite com vírgula em vez de ponto
        cNum := StrTran(cNum, ",", ".")
        
        AADD(aVetor, Val(cNum))
    NEXT

// Chamada da função de ordenação
    aVetor := BubbleSort(aVetor)

// Exibição do resultado
    QOut("")
    QOut("=== Vetor Ordenado ===")
    
    FOR nI := 1 TO Len(aVetor)
        QOut(Transform(aVetor[nI], "@E 999,999.99")) // Formatação visual limpa
    NEXT

RETURN NIL


FUNCTION BubbleSort(aVetor)

    LOCAL nI     := 0
    LOCAL nJ     := 0
    LOCAL nTemp  := 0
    LOCAL nTamanho := Len(aVetor)
    LOCAL lTrocou  := .T.

// Enquanto houver trocas na passagem anterior, continua
    FOR nI := 1 TO nTamanho - 1
        IF !lTrocou
            EXIT // Sai do loop se o vetor já estiver ordenado
        ENDIF

        lTrocou := .F. // Reseta o controle para a nova passagem

        FOR nJ := 1 TO nTamanho - nI
            IF aVetor[nJ] > aVetor[nJ + 1]
                
// Troca dos elementos
                nTemp         := aVetor[nJ]
                aVetor[nJ]     := aVetor[nJ + 1]
                aVetor[nJ + 1] := nTemp

                lTrocou := .T. // Indica que houve troca
            ENDIF
        NEXT
    NEXT

RETURN aVetor
