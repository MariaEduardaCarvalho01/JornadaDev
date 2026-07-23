//EXERCÍCIO 08 - MÓDULO 06

#define QTD_NOTAS 4

procedure Main()
    local nQtdAlunos   := 0
    local cEntrada     := ""
    local cNome        := ""
    local nNota        := 0
    local aListaAlunos := {}
    local aAluno       := {}
    local nI           := 0
    local nJ           := 0
    local nMedia       := 0
    local lAchou       := .F.

    CLEAR SCREEN

// 1. Leitura da quantidade de alunos
    do while nQtdAlunos <= 0
        accept "Digite a quantidade de alunos a cadastrar: " to cEntrada
        cEntrada := AllTrim(cEntrada)

        if Empty(cEntrada) .OR. !IsDigit(cEntrada) .OR. Val(cEntrada) <= 0
            QOut("Quantidade invalida! Digite um numero maior que zero.")
            QOut("")
            loop
        endif

        nQtdAlunos := Val(cEntrada)
    enddo

// 2. Leitura dos dados de cada aluno
    for nI := 1 to nQtdAlunos
        QOut("")
        QOut("--- Cadastro do Aluno " + AllTrim(Str(nI)) + " de " + AllTrim(Str(nQtdAlunos)) + " ---")

// Validação do Nome
        cNome := ""
        do while Empty(cNome)
            accept "Digite o nome do aluno: " to cNome
            cNome := AllTrim(cNome)
            if Empty(cNome)
                QOut("O nome nao pode ficar em branco!")
            endif
        enddo

        aAluno := {cNome}

// Leitura e validação das 4 notas
        for nJ := 1 to QTD_NOTAS
            do while .T.
                accept "Digite a " + AllTrim(Str(nJ)) + "a nota (0 a 10): " to cEntrada
                cEntrada := AllTrim(cEntrada)

                if Empty(cEntrada) .OR. !IsDigit(StrTran(cEntrada, ".", ""))
                    QOut("Nota invalida! Digite um valor numerico.")
                    loop
                endif

                nNota := Val(cEntrada)
                if nNota < 0 .OR. nNota > 10
                    QOut("Nota fora do intervalo permitido (0 a 10).")
                    loop
                endif

                exit
            enddo

            AAdd(aAluno, nNota)
        next

// Adiciona a estrutura {nome, n1, n2, n3, n4} na lista principal
        AAdd(aListaAlunos, aAluno)
    next

// 3. Exibição do Relatório Separado (Aprovados e Reprovados)
    QOut("")
    QOut("==================================================")
    QOut("              RELATORIO DE RENDIMENTO             ")
    QOut("==================================================")

// --- LISTA DE APROVADOS (Média >= 7) ---
    QOut("")
    QOut(">>> ALUNOS APROVADOS (Media >= 7.0) <<<")
    QOut("--------------------------------------------------")
    lAchou := .F.

    for nI := 1 to Len(aListaAlunos)
        aAluno := aListaAlunos[nI]
        nMedia := CalcularMediaAluno(aAluno)

        if nMedia >= 7.0
            QOut("Aluno: " + PadR(aAluno[1], 20) + " | Media: " + AllTrim(Str(nMedia, 5, 2)))
            lAchou := .T.
        endif
    next

    if !lAchou
        QOut("Nenhum aluno aprovado.")
    endif

// --- LISTA DE REPROVADOS (Média < 7) ---
    QOut("")
    QOut(">>> ALUNOS REPROVADOS (Media < 7.0) <<<")
    QOut("--------------------------------------------------")
    lAchou := .F.

    for nI := 1 to Len(aListaAlunos)
        aAluno := aListaAlunos[nI]
        nMedia := CalcularMediaAluno(aAluno)

        if nMedia < 7.0
            QOut("Aluno: " + PadR(aAluno[1], 20) + " | Media: " + AllTrim(Str(nMedia, 5, 2)))
            lAchou := .T.
        endif
    next

    if !lAchou
        QOut("Nenhum aluno reprovado.")
    endif

    QOut("==================================================")
    QOut("")
return

// FUNÇÕES AUXILIARES

// Recebe a estrutura {nome, n1, n2, n3, n4} e calcula a média das notas
function CalcularMediaAluno(aAluno)
    local nSoma := 0
    local nI    := 0

// Inicia no índice 2 pois o índice 1 é o nome do aluno
    for nI := 2 to Len(aAluno)
        nSoma += aAluno[nI]
    next
return nSoma / QTD_NOTAS
