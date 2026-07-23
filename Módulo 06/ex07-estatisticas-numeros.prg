//EXERCÍCIO 07 - MÓDULO 06

procedure Main()
    local aNumeros := {}
    local cEntrada := ""
    local nNumero  := 0
    local nSoma    := 0
    local nMedia   := 0
    local cLista   := ""
    local nI       := 0

    CLEAR SCREEN

// 1. Leitura e validação dos 10 números
    do while Len(aNumeros) < 10
        accept "Insira o " + AllTrim(Str(Len(aNumeros) + 1)) + "o numero de 10: " to cEntrada
        cEntrada := AllTrim(cEntrada)

// Valida se a entrada não está vazia e se contém apenas dígitos (permitindo sinal negativo)
        if Empty(cEntrada) .OR. !IsDigit(StrTran(cEntrada, "-", ""))
            QOut("Entrada invalida! Por favor, digite um numero valido.")
            QOut("")
            loop
        endif

        nNumero := Val(cEntrada)
        AAdd(aNumeros, nNumero)
    enddo

// 2. Ordenação do Array em ordem crescente
    ASort(aNumeros)

// 3. Cálculo das estatísticas
    nSoma  := SomaListaN(aNumeros)
    nMedia := nSoma / Len(aNumeros)

// 4. Montagem da string com os números ordenados
    for nI := 1 to Len(aNumeros)
        cLista += AllTrim(Str(aNumeros[nI]))
        if nI < Len(aNumeros)
            cLista += ", "
        endif
    next

// 5. Exibição limpa do painel de resultados
    QOut("")
    QOut("==========================================")
    QOut("          ESTATISTICAS DOS NUMEROS        ")
    QOut("==========================================")
    QOut("Numeros em ordem crescente: " + cLista)
    QOut("Soma total:                 " + AllTrim(Str(nSoma)))
    QOut("Media aritmetica:           " + AllTrim(Str(nMedia, 10, 2)))
    QOut("Menor numero (aV[1]):       " + AllTrim(Str(aNumeros[1])))
    QOut("Maior numero (aV[Len]):     " + AllTrim(Str(aNumeros[Len(aNumeros)])))
    QOut("==========================================")
    QOut("")
return

// FUNÇÃO MÓDULO (REUTILIZÁVEL)

function SomaListaN(aLista)
    local nSoma := 0
    local nI    := 0

    for nI := 1 to Len(aLista)
        nSoma += aLista[nI]
    next
return nSoma
