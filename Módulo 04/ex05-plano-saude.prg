FUNCTION Main()

    LOCAL nIdade := 0
    LOCAL nIntegrantes := 0
    LOCAL nAdicionarIntegrantes := 0
    LOCAL nValorMensalidade := 0

    INPUT "Insira sua Idade: " TO nIdade
    INPUT "Insira o total de Integrantes: " TO nIntegrantes

    IF nIdade <= 0

        QOut ("Insira uma idade maior que Zero")

        RETURN NIl
    
    ENDIF

    IF nIntegrantes >= 0
        nAdicionarIntegrantes := nIntegrantes * 90
    
    ELSE 
        QOut("Insira um Valor Igual ou maior que ZERO ")

        RETURN NIL
    
    ENDIF

    DO CASE

        CASE nIdade <= 25
            nValorMensalidade := 180
        
        CASE nIdade <= 40
            nValorMensalidade := 260

        CASE nIdade <= 60
            nValorMensalidade := 380

        OTHERWISE 
            nValorMensalidade := 520

    ENDCASE

    nValorMensalidade := nValorMensalidade + nAdicionarIntegrantes

    QOut("O Valor Total do plano é de R$: " + Alltrim(str(nValorMensalidade, 10, 2)))

RETURN NIL
