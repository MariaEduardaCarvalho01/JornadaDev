// EXERCÍCIO 11 - MÓDULO 06 PARTE 2

SET PROCEDURE TO estoque_lib.prg

FUNCTION Main()

    LOCAL aEstoque := {}
    LOCAL cOpcao   := ""

    DO WHILE .T.

        QOut("")
        QOut("===== CONTROLE DE ESTOQUE =====")
        QOut("1 - Cadastrar produto")
        QOut("2 - Listar produtos")
        QOut("3 - Entrada de estoque")
        QOut("4 - Saida de estoque")
        QOut("5 - Buscar produto")
        QOut("6 - Relatorio")
        QOut("0 - Sair")
        QOut("===============================")

        ACCEPT "Opcao: " TO cOpcao
        cOpcao := AllTrim(cOpcao)

        DO CASE

            CASE cOpcao == "1"
                CadastrarProduto(aEstoque)

            CASE cOpcao == "2"
                ListarProdutos(aEstoque)

            CASE cOpcao == "3"
                EntradaEstoque(aEstoque)

            CASE cOpcao == "4"
                SaidaEstoque(aEstoque)

            CASE cOpcao == "5"
                BuscarMenu(aEstoque)

            CASE cOpcao == "6"
                RelatorioEstoque(aEstoque)

            CASE cOpcao == "0"
                QOut("Saindo do programa...")
                EXIT

            OTHERWISE
                QOut("Opcao invalida! Tente novamente.")

        ENDCASE

    ENDDO

RETURN NIL


FUNCTION BuscarMenu(aEstoque)

    LOCAL cCodigo := ""
    LOCAL nPos    := 0

    ACCEPT "Codigo para buscar: " TO cCodigo
    cCodigo := AllTrim(cCodigo)

    IF Empty(cCodigo)
        QOut("Codigo invalido!")
        RETURN NIL
    ENDIF

    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos > 0
        QOut("-----------------------------------")
        QOut("Produto encontrado na posicao: " + Str(nPos))
        QOut("Codigo:     " + aEstoque[nPos][1])
        QOut("Nome:       " + aEstoque[nPos][2])
        QOut("Quantidade: " + Str(aEstoque[nPos][3]))
        QOut("Preco:      R$ " + Transform(aEstoque[nPos][4], "@E 999,999.22"))
        QOut("-----------------------------------")
    ELSE
        QOut("Produto nao encontrado!")
    ENDIF

RETURN NIL
