// Exercício 6

PROCEDURE Main()

   LOCAL nSecreto := 0
   LOCAL nPalpite := 0
   LOCAL nTentativa := 0
   LOCAL nMaxTentativas := 7
   LOCAL lAcertou := .F.
   LOCAL cPalpite := ""

    nSecreto := HB_RandomInt(1,100)

    ?"Estou pensando em um número aleatório ente 1 e 100."
    ?"Você tem " + Str(nMaxTentativas) + "tentativas para adivinhar."

    FOR nTentativa := 1 TO nMaxTentativas
        ?"Tentativa " + Str(nTentativa) + " de " + Str(nMaxTentativas)

        DO WHILE .T.
            ?"Digite seu palpite( 1 a 100):"
            ACCEPT "Papite: " to cPalpite
            nPalpite := Val(cPalpite)
            IF nPalpite >= 1 .AND. nPalpite <=100
                EXIT
            ENDIF

            ?"Erro! O Palpite deve ser entre 1 e 100!"
        
        ENDDO

        IF nPalpite == nSecreto
            lAcertou := .T.

            ?"Correto, Parabéns!"
            ? "O npumero secreto era: + Str(nSecreto)"
            ?"Você conseguiu na tentaviva " + Str(nTentativa) + "!"
            EXIT
        ELSE

            IF nPalpite < nSecreto
                ?"Errado! O número secreto é MAIOR que " + Str(nPalpite)
            ELSE
                ?"Errado! O número secreto é MENOR que " + Str(nPalpite)
            ENDIF

            IF nTentativa < nMaxTentativas
                ?"Tentativas restantes: " + Str(nMaxTentativas - nTentativa)
            ENDIF
        ENDIF

    NEXT

    IF !lAcertou

        ?"Suas chances acabaram!"
        ?"O número secreto era: " + Str(nSecreto)

    ENDIF

    ?"Precione qualquer tecla para sair"
    Inkey(0)

RETURN
