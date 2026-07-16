FUNCTION Main()

    LOCAL cTextoLongo := "Harbour"
    LOCAL cTextoCurto  := "Harb"

    QOut(cTextoLongo = cTextoCurto) //Exibe .T.

    QOut(cTextoLongo == cTextoCurto) // Exibe .F.

RETURN NIL

//"=" É uma igualdade parcial, compara apenas o ínicio da string.
//"==" É uma igualdade exata, compara a string inteira.
