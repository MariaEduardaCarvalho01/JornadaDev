#define PI 3.14159

FUNCTION main()

    LOCAL cEntrada
    LOCAL nRaio
    LOCAL nArea
    LOCAL nCatetoA
    LOCAL nCatetoB
    LOCAL nHipotenusa
    LOCAL nPeso
    LOCAL nAltura
    LOCAL nIMC

    //Área círculo
    ACCEPT "Informe o raio do círculo: "TO cEntrada
    nRaio := Val(cEntrada)

    nArea:= PI * (nRaio ^ 2)

    QOut("Área do circulo: " + Str(nArea, 10,2))
    QOut("")
    //Hipotenusa
    ACCEPT "Informe o primeiro cateto: " TO cEntrada
    nCatetoA := Val(cEntrada)

    ACCEPT "Informe o segundo cateto: " TO cEntrada
    nCatetoB :=Val(cEntrada)

    nHipotenusa := Sqrt((nCatetoA ^ 2)+(nCatetoB ^ 2))

    QOut("Hipotenusa: " + Str(nHipotenusa, 10,2))
    QOut("")
    //IMC
    ACCEPt "Informe o peso(Kg): " TO cEntrada
    nPeso :=Val(cEntrada)
    ACCEPT "Informe a altura (m): " TO cEntrada
    nAltura := Val(cEntrada)
    nIMC:= nPeso/ (nAltura ^ 2)
    QOut("O IMC é: " + Str(nIMC,10,2))

RETURN NIL
