; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     4.1 - Mayor, Menor o Igual con Entrada del Usuario.
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msg1        BYTE "Ingresa el primer numero: ", 0
    msg2        BYTE "Ingresa el segundo numero: ", 0
    msgIguales  BYTE "Los numeros son iguales.", 0
    msgMayor    BYTE "El primer numero es mayor.", 0
    msgMenor    BYTE "El primer numero es menor.", 0

.code
main PROC
    mov edx, OFFSET msg1        ; Pide el primer número al usuario
    call WriteString
    call ReadInt         ; Lee un entero firmado y lo deja en EAX
    mov ebx, eax         ; Guardamos el primer número temporalmente en EBX

    mov edx, OFFSET msg2         ; Pide el segundo número al usuario

    call WriteString
    call ReadInt         ; Lee el segundo entero y lo deja en EAX

    cmp ebx, eax            ; Comparar los numeros

    je es_igual          ; Salta si EBX == EAX
    jg es_mayor          ; Salta si EBX > EAX
    jl es_menor          ; Salta si EBX < EAX

es_igual:
    mov edx, OFFSET msgIguales
    call WriteString
    call Crlf
    jmp fin

es_mayor:
    mov edx, OFFSET msgMayor
    call WriteString
    call Crlf
    jmp fin

es_menor:
    mov edx, OFFSET msgMenor
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main