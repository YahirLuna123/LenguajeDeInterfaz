; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     5.1 - Repetir hasta que el usuario ingrese 0.
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgPrompt BYTE "Ingresa un numero (0 para salir): ", 0
    msgSalida BYTE "Has ingresado el 0. Fin del programa.", 0

.code
main PROC

ciclo_repetir:
    mov edx, OFFSET msgPrompt       ; Pide un número al usuario
    call WriteString
    call ReadInt         ; Lee el número ingresado y lo deja en EAX

    cmp eax, 0           ;Evalua si el número es igual a 0

    je salir             ; Si EAX == 0, salta fuera del ciclo

    jmp ciclo_repetir     ; Salto incondicional para repetir el ciclo

salir:
    call Crlf
    mov edx, OFFSET msgSalida
    call WriteString
    call Crlf

    exit
main ENDP
END main