; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     6 - Decremento e Incremento,
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgInicio    BYTE "Valor inicial: ", 0
    msgInc       BYTE "Despues incrementar: ", 0
    msgDec       BYTE "Despues decrementar: ", 0

.code
main PROC
    mov eax, 10    ; Inicializamos un registro

    mov edx, OFFSET msgInicio       ; Muestra el valor inicial
    call WriteString
    call WriteDec        
    call Crlf

    ; La instrucción Incrementa el valor en 1
    inc eax              ; EAX pasa de 10 a 11
    
    mov edx, OFFSET msgInc
    call WriteString
    call WriteDec       
    call Crlf

    ; La instrucción Decrementa el valor en 1
    dec eax              ; EAX regresa de 11 a 10
    dec eax              ; EAX baja a 9

    mov edx, OFFSET msgDec
    call WriteString
    call WriteDec        

    exit
main ENDP
END main