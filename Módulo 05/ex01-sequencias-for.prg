// Exercício 1 

PROCEDURE Main()
    
    LOCAL nNumero

    ?"A) Números de 1 a 100:"
    FOR nNumero := 1 TO 100
        ??Str(nNumero)+ " "
    NEXT
    ?

    ?"B) Números de -50 a 50:"
    FOR nNumero := -50 TO 50
        ??Str(nNumero) + " "
    NEXT
    ?

    ?"C) Número de 80 a 5 (Decrescente):"
    FOR nNumero := 80 TO 5 STEP -1
        ??Str(nNumero) + " "
    NEXT
    ?

    ? "Pressione qualquer tecla para sair."
    Inkey(0)

RETURN
