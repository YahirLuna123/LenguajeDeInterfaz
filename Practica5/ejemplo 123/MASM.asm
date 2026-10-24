; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     5 - Condicionales.
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgPrompt BYTE "Ingresa un numero entero: ", 0
    msgPos    BYTE "El numero es positivo.", 0
    msgNeg    BYTE "El numero es negativo.", 0
    msgCero   BYTE "El numero es cero.", 0

.code
main PROC
    mov edx, OFFSET msgPrompt    ; Pedir un número al usuario
    call WriteString
    call ReadInt         ; Lee el número y lo guarda en EAX

    cmp eax, 0      ; Evaluar el número comparándolo con 0
    jg es_positivo       ; Si es mayor que 0 Salta a positivo
    jl es_negativo       ; Si es menor que 0 Salta a negativo
    je es_cero           ; Si es exactamente igual a 0 Salta a cero

es_positivo:
    mov edx, OFFSET msgPos
    call WriteString
    call Crlf
    jmp fin

es_negativo:
    mov edx, OFFSET msgNeg
    call WriteString
    call Crlf
    jmp fin

es_cero:
    mov edx, OFFSET msgCero
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main