FUNCTION Main()
    LOCAL aMeses := {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    LOCAL nMes := 0

    INPUT "Insira o Número do mês: " TO nMes

    IF nMes >= 1 .AND. nMes <= 12

        QOut("Mês: " + aMeses[nMes])

    ELSE
        QOut("Mês Inválido")
    
    ENDIF

RETURN NIL
