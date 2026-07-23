procedure Main()
    local cJogadaCPU := ""
    local cJoagadaUser := ""
    local cVencedor := ""
    local cContinuar := "S"

    do while Upper(cContinuar) == "S"
        CLEAR SCREEN

//1. Sorteia a jogada do computador
        cJogadaCPU := SortearJogadaCPU()

//2. Loop de leitura e validação do usuário
        cJogadaUser := ""
        do while .T.
            ACCEPT "Qual é a sua jogada (PEDRA, PAPEL ou TESOURA): " to cJogadaUser
            cJogadaUser := Upper(AllTrim(cJogadauser))

            if ValidarJogada(cJogadaUser)
                exit
            endif
            
            QOut("Entrada inválida! Tente novamente.")
            QOut("")

        enddo

//3. Define o vencedor da rodada
        cVencedor := DefeinirVencedor (cJogadaUser, cJogadaCPU)

//4. Exibe o resultado formatado
        MostraDisplayVencedor(cJogadaUser, cJogadaCPU, cVencedor)

//5. Perguntar se deseja jogar novamente.
        ACCEPT "Deseja jogar novamente? (S/N): " to cContinuar
    enddo

    QOut("")
    QOut("Obrigada por jogar!")

Return

// FUNÇÕES MÓDULO

function SortearJogadaCPU()
    local aJogadas := {"PEDRA", "PAPEL", "TESOURA"}
Return aJogada[ HB_RandomInt(1, 3) ]

function  ValidarJogada(cJogada)

Return !Empty(cJogada) .AND. (cJogada $ "PEDRA | PAPEL TESOURA")

function DefinirVencedor (cJogada1, cJogada2)
    local cJ1 := Upper(cJogada1)
    local cJ2 := upper(cJogada2)
    
    do case
        case cJ1 == cJ2
            Return "Empate!"

        case(cJ1 == "PEDRA" .AND. cJ2 == "TESOURA") .OR. ;
            (cJ1 == "TESOURA" .AND. cJ2 == "PAPEL") .OR. ;
            (cJ1 == "PAPEL" .AND. cJ2 == "PEDRA")
            Return "Você Venceu!"
        Otherwise
            Return "Computador Venceu!"
    endcase

Return ""

procedure MostrarDisplayVencedor(cJogadaUsuario, cJogadaComputador, cVencedor)
    QOut("")
    QOut("==============================")
    QOut("     RESULTADO JOKENPO")
    QOut("==============================")
    QOut("Você jogou:   " + Upper(cJogadaUsuario))
    QOut("Computador jogou:   " + cJogadaComputador)
    QOut("Resultado:   " + cVencedor)
    QOut("==============================")
    QOut("")
Return
