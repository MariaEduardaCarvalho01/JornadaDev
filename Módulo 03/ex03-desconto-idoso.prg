FUNCTION Main()

    LOCAL cNome
    LOCAL cData
    LOCAL cPreco
    LOCAL dNascimento
    LOCAL nPreco
    LOCAL nIdade
    LOCAL nDesconto := 0
    LOCAL nTotal

    ACCEPT "Nome do Cliente: " TO cNome
    
    ACCEPT "Data de Nascimento (DD/MM/AAAA): " TO cData
    dNascimento := CToD(cData)
    
    ACCEPT "Preço do produto: " TO cPreco
    nPreco:=Val(cPreco)

    nIdade:= Int((Date() - dNascimento) / 365)

    IF nIdade > 60
        nDesconto:= nPreco *0.125
    ENDIF

    nTotal:= nPreco - nDesconto

    QOut("")
    QOut("======= DETALHES =======")
    QOut("Clientes: "+ cNome)
    QOut("Idade: " + Str(nIdade, 3))
    QOut("Preço: R$" + Str(nPreco,10,2))
    QOut("Desconto: R$" + Str(nDesconto,10,2))
    QOut("Total : R$" + Str(nTotal,10,2))

RETURN NIL
