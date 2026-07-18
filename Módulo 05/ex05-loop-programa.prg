// Exercício 5 

PROCEDURE Main()
    
    LOCAL cNome := ""
    LOCAL cDisc := ""
    LOCAL cNota1 := ""
    LOCAL cNota2 := ""
    LOCAL nNota1 := 0
    LOCAL nNota2 := 0
    LOCAL nMedia := 0
    LOCAL cContinuar := "S"


    DO WHILE cContinuar =="S"

        DO WHILE .T.
            ?"Insira o nome do aluno:"
            ACCEPT "Nome: " TO cNome
            IF Len(Trim(cNome)) > 0
                EXIT
            ENDIF

            ?"Erro! O campo nome não pode estar vazio!"

        ENDDO

        ?"Nome Aceito: " + cNome

        DO WHILE .T.
            ?"Insira a disciplina (EX:. MAT, POR, ART, etc..)"
            ACCEPT "Disciplina: " TO cDisc
            IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc)
                EXIT
            ENDIF
        ENDDO

        ?"Disiplina aceita: " + cDisc

        DO WHILE .T.
            ? "Digite a nota 1 (0 a 10):"
            ACCEPT "Nota 1: " TO cNota1
            nNota1 := Val(cNota1)
            IF nNota1 >= 0 .AND. nNota1 <= 10
                EXIT
            ENDIF 

            ?"Erro! A nota deve ser entre 0 e 10!"

        ENDDO

        ? "Nota 1 aceita: " + Str(nNota2, 5, 2)

        DO WHILE .T.
            ? "Digite a nota 2 (0 a 10):"
            ACCEPT "Nota 2: " TO cNota2
            nNota2 := Val(cNota2)
            IF nNota2 >= 0 .AND. nNota2 <= 10
                EXIT
            ENDIF

            ?"Erro! A nota deve ser entre 0 e 10!"

        ENDDO

        ? "Nota 2 aceita: " + Str(nNota2, 5, 2)

        nMedia := (nNota1 + nNota2) / 2

        ? "Dados do Aluno"
        ? "Nome: " + cNome
        ? "Disciplina: " + cDisc
        ? "Nota 1: " + Str(nNota1, 5, 2)
        ? "Nota 2: " + Str(nNota2, 5, 2)
        ? "Média: " + Str(nMedia, 5, 2)

        DO WHILE .T.
            ? "Deseja calcular a média de outro aluno?"
            ACCEPT "Continuar: " TO cContinuar
            cContinuar := Upper(Trim(cContinuar))
            IF cContinuar == "S" .OR. cContinuar =="N"
                EXIT
            ENDIF

            ?"Erro! Digite S para SIM e N para NÃO!"

        ENDDO
    
    ENDDO

    ?"Pressione qualquer tecla para sair"
    Inkey(0)

RETURN
