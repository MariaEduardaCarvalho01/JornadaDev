//EXERCÍCIO 09 - MÓDULO 06

procedure Main()
    local cNomeItem     := ""
    local cPrecoEntrada := ""
    local nPrecoItem    := 0
    local aMiniCarrinho := {}
    local aItem         := {}
    local nTotal        := 0
    local nI            := 0

    hb_langSelect("PT")
    CLEAR SCREEN

// 1. Loop de inserção no carrinho (encerra com "0")
    do while .T.
        QOut("--------------------------------------------------")
        accept "Digite o nome do produto (ou '0' para finalizar): " to cNomeItem
        cNomeItem := AllTrim(cNomeItem)

// Condição de parada
        if cNomeItem == "0"
            exit
        endif

        if Empty(cNomeItem)
            QOut("Nome do produto nao pode ser em branco!")
            loop
        endif

// Validação do preço do produto
        do while .T.
            accept "Digite o valor do produto R$: " to cPrecoEntrada
            cPrecoEntrada := AllTrim(cPrecoEntrada)

// Troca vírgula por ponto para aceitar decimais do padrão brasileiro
            cPrecoEntrada := StrTran(cPrecoEntrada, ",", ".")

            if Empty(cPrecoEntrada) .OR. !IsDigit(StrTran(cPrecoEntrada, ".", ""))
                QOut("Valor invalido! Digite um numero positivo.")
                loop
            endif

            nPrecoItem := Val(cPrecoEntrada)
            if nPrecoItem < 0
                QOut("O valor do produto nao pode ser negativo.")
                loop
            endif

            exit
        enddo

// Armazena a estrutura {nome, preco}
        AAdd(aMiniCarrinho, {cNomeItem, nPrecoItem})
        QOut("-> Item '" + cNomeItem + "' adicionado com sucesso!")
        QOut("")
    enddo

// 2. Exibição da listagem final e totalização
    CLEAR SCREEN
    QOut("==================================================")
    QOut("             RESUMO DO CARRINHO DE COMPRAS        ")
    QOut("==================================================")

    if Len(aMiniCarrinho) == 0
        QOut("O carrinho esta vazio.")
    else
        QOut("ITENS SELECIONADOS:")
        QOut("--------------------------------------------------")

        for nI := 1 to Len(aMiniCarrinho)
            aItem := aMiniCarrinho[nI]
// Acumula o total (preço é o índice 2)
            nTotal += aItem[2]
            
// Exibe o item com alinhamento e preço formatado
            QOut(PadR(AllTrim(Str(nI)) + ". " + aItem[1], 32) + " | R$ " + FormatarValorN(aItem[2]))
        next

        QOut("--------------------------------------------------")
        QOut("Quantidade total de itens: " + FormatarValorNtoC(Len(aMiniCarrinho)))
        QOut("VALOR TOTAL DA COMPRA:     R$ " + FormatarValorN(nTotal))
    endif

    QOut("==================================================")
    QOut("")
return

// FUNÇÕES DE FORMATAÇÃO

// Formata valores numéricos/monetários com 2 casas decimais
function FormatarValorN(nValor)
return AllTrim(Str(nValor, 10, 2))

// Formata quantidades (números inteiros)
function FormatarValorNtoC(nValor)
return AllTrim(Str(nValor, 10, 0))
