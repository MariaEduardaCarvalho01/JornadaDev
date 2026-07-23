//EXERCÍCIO 06- MÓDULO 06

procedure Main()
    Local cEntrada := ""
    Local nDiaSemana := 0
    Local cDiaExtenso := ""

    CLEAR SCREEN

//Loop até receber uma entrada válida.

    do while .T.
        ACCEPT "Digite um número de 1 a 7 para o dia da semana: " to cEntrada
        nDiaSemana := Int(Val(cEntrada))

        if ValidarDiaSemana (nDiaSemana)
            exit
        endif

        QOut("Aviso: Número inválido! Por favor, digite um valor entre 1 e 7.")
        QOut("")
    enddo

// Busca o nome do dia usando o índice do array

    cDiaExtenso := DiaDaSemana(nDiaSemana)

    QOut("")
    QOut("O dia correspondente é :" + cDiaExtenso)
Return

// FUNÇÕES MÓDULO

function ValidarDiaSemana(nDia)
Return nDia >= 1 .AND. nDia <= 7

function DiaDaSemana(nDia)
    local aDias := {"Domingo", ;
                    "Segunda-Feira", ;
                    "Terça-Feira", ;
                    "Quarta-Feira", ;
                    "Quinta-Feira", ;
                    "Sexta-Feira", ;
                    "Sabádo"}
Return aDias[nDia]
