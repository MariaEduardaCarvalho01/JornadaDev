REQUEST HB_LANG_PT
FUNCTION Main()
    LOCAL cNome:="Maria Eduarda"
    LOCAL cCidade:= "Piedade"
    LOCAL cCurso:= "Harbour/ADVPL"

    hb_cdpSelect("PT850")
    hb_langSelect("PT")

    QOut("=========================")
    QOut("  FICHA DE APRESENTAÇÃO  ")
    QOut("=========================")
    QOut("Nome:" + cNome)
    QOut("Cidade:" + cCidade)
    QOut("Curso:" + cCurso)
    QOut("Data :" + DToC(Date()))
    QOut("Hora:" + Time())
    QOut("=========================")

RETURN NIL
