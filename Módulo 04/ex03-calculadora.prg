FUNCTION Main()
   
    LOCAL cOperacao
    LOCAL cNumero1, cNumero2
    LOCAL nNumero1, nNumero2
    LOCAL nResultado

    ACCEPT "Informe o tipo de calcúlo que quer realizar (+, -, *, /, ^ ou R): " TO cOperacao
    ACCEPT "Insira o 1º número: " TO cNumero1
    ACCEPT "Insira o 2º número: " TO cNumero2

    nNumero1 := Val(cNumero1)
    nNumero2 := Val(cNumero2)

    DO CASE

    CASE cOperacao == "+"
        nResultado := nNumero1 + nNumero2
        QOut("")
        QOut("-------CALCULADORA-------")
        QOut("Result: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "-"
        nResultado := nNumero1 - nNumero2
        QOut("")
        QOut("-------CALCULADORA-------")
        QOut("Result: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "*"
        nResultado := nNumero1 * nNumero2
        QOut("")
        QOut("-------CALCULADORA-------")
        QOut("Result: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "/"
        IF nNumero2 == 0
            QOut("")
            QOut("-------CALCULADORA-------")
            QOut("Não é possível realizar uma divisão por ZERO")

        ELSE
            nResultado := nNumero1 / nNumero2
            QOut("")
            QOut("-------CALCULADORA-------")
            QOut("Result: " + LTrim(Str(nResultado,10,2)))
        ENDIF

    CASE cOperacao == "^"
        nResultado := nNumero1 ** nNumero2
        QOut("")
        QOut("-------CALCULADORA-------")
        QOut("Result: " + LTrim(Str(nResultado,10,2)))

    CASE cOperacao == "R"
        nResultado := Sqrt(nNumero1)
        QOut("")
        QOut("-------CALCULADORA-------")
        QOut("Result: " + LTrim(Str(nResultado,10,2)))

    OTHERWISE

        QOut("")
        QOut("------- CALCULADORA -------")
        QOut("Operação Inválida, Tente Novamente")

    ENDCASE

RETURN NIL
