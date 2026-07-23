//EXERCÍCIO 11 - MÓDULO 06 - PARTE 1

// Cadastra um novo produto no array de estoque
FUNCTION CadastrarProduto(aEstoque)
    LOCAL cCodigo := ""
    LOCAL cNome   := ""
    LOCAL cQtd    := ""
    LOCAL cPreco  := ""
    LOCAL nQtd    := 0
    LOCAL nPreco  := 0

    QOut("=== CADASTRAR PRODUTO ===")
    
    ACCEPT "Codigo do produto: " TO cCodigo
    cCodigo := AllTrim(cCodigo)

    IF Empty(cCodigo)
        QOut("Erro: Codigo invalido/vazio!")
        RETURN .F.
    ENDIF

    IF BuscarProduto(aEstoque, cCodigo) > 0
        QOut("Erro: Produto ja cadastrado!")
        RETURN .F.
    ENDIF

    ACCEPT "Nome do produto: " TO cNome
    cNome := AllTrim(cNome)

    IF Empty(cNome)
        QOut("Erro: Nome invalido/vazio!")
        RETURN .F.
    ENDIF

    ACCEPT "Quantidade inicial: " TO cQtd
    nQtd := Val(cQtd)

    IF nQtd < 0
        QOut("Erro: A quantidade nao pode ser negativa!")
        RETURN .F.
    ENDIF

    ACCEPT "Preco unitario: " TO cPreco
    nPreco := Val(cPreco)

    IF nPreco <= 0
        QOut("Erro: Preco invalido!")
        RETURN .F.
    ENDIF

// Adiciona o produto ao array
    AADD(aEstoque, {cCodigo, cNome, nQtd, nPreco})
    QOut("Produto cadastrado com sucesso!")

RETURN .T.


// Listar todos os produtos
FUNCTION ListarProdutos(aEstoque)
    LOCAL nI

    QOut("=== LISTA DE PRODUTOS ===")

    IF Len(aEstoque) == 0
        QOut("Estoque vazio!")
        RETURN NIL
    ENDIF

    FOR nI := 1 TO Len(aEstoque)
        QOut("Codigo:     " + aEstoque[nI][1])
        QOut("Nome:       " + aEstoque[nI][2])
        QOut("Quantidade: " + Str(aEstoque[nI][3]))
        QOut("Preco:      R$ " + Transform(aEstoque[nI][4], "@E 999,999.22"))
        QOut("-----------------------------------")
    NEXT

RETURN NIL


// Entrada de Estoque (Aumenta quantidade)
FUNCTION EntradaEstoque(aEstoque)
    LOCAL cCodigo := ""
    LOCAL cQtd    := ""
    LOCAL nQtd    := 0
    LOCAL nPos    := 0

    QOut("=== ENTRADA DE ESTOQUE ===")

    ACCEPT "Codigo do produto: " TO cCodigo
    cCodigo := AllTrim(cCodigo)

    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        QOut("Erro: Produto nao encontrado!")
        RETURN .F.
    ENDIF

    ACCEPT "Quantidade de entrada: " TO cQtd
    nQtd := Val(cQtd)

    IF nQtd <= 0
        QOut("Erro: Quantidade invalida!")
        RETURN .F.
    ENDIF

    aEstoque[nPos][3] += nQtd
    QOut("Estoque atualizado com sucesso!")

RETURN .T.


// Saida de Estoque (Diminui quantidade com validacao)
FUNCTION SaidaEstoque(aEstoque)
    LOCAL cCodigo := ""
    LOCAL cQtd    := ""
    LOCAL nQtd    := 0
    LOCAL nPos    := 0

    QOut("=== SAIDA DE ESTOQUE ===")

    ACCEPT "Codigo do produto: " TO cCodigo
    cCodigo := AllTrim(cCodigo)

    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        QOut("Erro: Produto nao encontrado!")
        RETURN .F.
    ENDIF

    ACCEPT "Quantidade de saida: " TO cQtd
    nQtd := Val(cQtd)

    IF nQtd <= 0
        QOut("Erro: Quantidade invalida!")
        RETURN .F.
    ENDIF

    IF nQtd > aEstoque[nPos][3]
        QOut("Erro: Estoque insuficiente! Estoque atual: " + Str(aEstoque[nPos][3]))
        RETURN .F.
    ENDIF

    aEstoque[nPos][3] -= nQtd
    QOut("Saida realizada com sucesso!")

RETURN .T.


// Busca produto por codigo e retorna a posicao (ou 0 se nao encontrar)
FUNCTION BuscarProduto(aEstoque, cCodigo)
    LOCAL nI

    cCodigo := AllTrim(cCodigo)

    FOR nI := 1 TO Len(aEstoque)
        IF Upper(aEstoque[nI][1]) == Upper(cCodigo)
            RETURN nI
        ENDIF
    NEXT

RETURN 0


// Relatorio de valor em estoque por produto e total geral
FUNCTION RelatorioEstoque(aEstoque)
    LOCAL nI
    LOCAL nValor := 0
    LOCAL nTotal := 0

    QOut("=== RELATORIO DE ESTOQUE ===")

    IF Len(aEstoque) == 0
        QOut("Estoque vazio!")
        RETURN NIL
    ENDIF

    FOR nI := 1 TO Len(aEstoque)
        nValor := aEstoque[nI][3] * aEstoque[nI][4]
        nTotal += nValor

        QOut(aEstoque[nI][2] + " (Cod: " + aEstoque[nI][1] + ") - Valor em estoque: R$ " + Transform(nValor, "@E 999,999.22"))
    NEXT

    QOut("-----------------------------------")
    QOut("TOTAL GERAL EM ESTOQUE: R$ " + Transform(nTotal, "@E 999,999.22"))

RETURN NIL
