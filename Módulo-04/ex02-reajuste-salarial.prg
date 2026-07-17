FUNCTION Main()

    LOCAL nSalario := 0
    LOCAL nNovoSalario := 0
    LOCAL nReajuste := 0
    LOCAL nPercentual := 0

    INPUT "Insira seu salário: " TO nSalario

    IF nSalario <= 0
        QOut("Salário inválido.")
    
    ELSEIF nSalario < 1000
        nPercentual :=0.15

    ELSEIF nSalario <= 2000
        nPercentual :=0.12

    ELSEIF nSalario <= 4000
        nPercentual :=0.08
    
    ELSE
        nPercentual:= 0.05

    ENDIF

    IF nSalario > 0

        nReajuste := nSalario * nPercentual
        nNovoSalario := nSalario * nReajuste

        QOut("O valor do reajuste é: R$" + AllTrim(Str(nReajuste, 10, 2)))
    ENDIF

RETURN NIL
