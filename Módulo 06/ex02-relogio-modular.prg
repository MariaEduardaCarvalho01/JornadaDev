// Exercício 02 - Módulo 06
Procedure Main()
    Local nInicio := Seconds()
    local tHora
    local cHoraFormatada

    CLEAR SCREEN

//Roda o loop por aproximadamente 30 segundos

    do while (Seconds() - nInicio) <30
        tHora := ObterHora()
        cHoraFormatada := FormatarHora(tHora)
        ExibirHora(cHoraFormatada)

// Aguarda 1 segundo antes de atualizar
        hb_IdleSleep(1)

    enddo

return

function Obterhora()
return hb_DateTime()

function FormatarHora(cHora)
return hb_TToC(cHora, "HH:MM:SS")

Procedure ExibirHora(cHora)
    @ 0, 0 SAY cHora
return
