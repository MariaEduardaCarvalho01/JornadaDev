// EXERCÍCIO 03 - MÓDULO 06

procedure Main()
    local nVal1     := 0
    local nVal2     := 0
    local cOperador := ""
    local uResultado := nil

    hb_langSelect("PT")

    do while .T.
        CLEAR SCREEN
        QOut("==========================================")
        QOut("          CALCULADORA REFATORADA          ")
        QOut("==========================================")

        // 1. Leitura dos dados
        nVal1     := LerNumero("Digite o primeiro numero: ")
        cOperador := ObterOperador()

        // Opção de encerramento
        if cOperador == "S"
            QOut("Saindo da calculadora...")
            exit
        endif

        nVal2 := LerNumero("Digite o segundo numero: ")

        // 2. Processamento dos cálculos
        uResultado := Calcular(nVal1, nVal2, cOperador)

        // 3. Exibição limpa do resultado
        MostrarResultado(nVal1, nVal2, cOperador, uResultado)

        QOut("")
        WAIT "Pressione qualquer tecla para continuar..."
    enddo
return

// ============================================================================
// FUNÇÕES AUXILIARES / MODULARIZADAS
// ============================================================================

// Lê um valor numérico garantindo validação de entrada
function LerNumero(cMensagem)
    local cEntrada := ""
    local nValor   := 0

    do while .T.
        accept cMensagem to cEntrada
        cEntrada := AllTrim(StrTran(cEntrada, ",", "."))

        if Empty(cEntrada) .OR. !IsDigit(StrTran(cEntrada, "-", ""))
            QOut("Entrada invalida! Por favor, digite um numero.")
            loop
        endif

        nValor := Val(cEntrada)
        exit
    enddo
return nValor

// Solicita e valida a operação desejada
function ObterOperador()
    local cOp := ""

    do while .T.
        QOut("Operacoes disponiveis: + , - , * , / (ou 'S' para Sair)")
        accept "Escolha a operacao: " to cOp
        cOp := Upper(AllTrim(cOp))

        if cOp $ "+-*/S" .AND. Len(cOp) == 1
            exit
        endif

        QOut("Operacao invalida! Tente novamente.")
        QOut("")
    enddo
return cOp

// Executa o cálculo via DO CASE e retorna .F. em caso de divisão por zero
function Calcular(n1, n2, cOp)
    local uRes := nil

    do case
    case cOp == "+"
        uRes := n1 + n2

    case cOp == "-"
        uRes := n1 - n2

    case cOp == "*"
        uRes := n1 * n2

    case cOp == "/"
        if n2 == 0
            uRes := .F. // Retorna .F. conforme solicitado no enunciado
        else
            uRes := n1 / n2
        endif
    endcase
return uRes

// Formata e exibe o resultado ou a mensagem de erro
procedure MostrarResultado(n1, n2, cOp, uRes)
    QOut("")
    QOut("------------------------------------------")

    if ValType(uRes) == "L" .AND. uRes == .F.
        QOut("ERRO: Divisao por zero nao e permitida!")
    else
        QOut("RESULTADO: " + AllTrim(Str(n1)) + " " + cOp + " " + AllTrim(Str(n2)) + " = " + AllTrim(Str(uRes, 12, 2)))
    endif

    QOut("------------------------------------------")
return
