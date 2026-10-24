; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     11 - Operaciones logicas
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgAnd BYTE "Resultado de AND: ", 0
    msgOr  BYTE "Resultado de OR:  ", 0
    msgXor BYTE "Resultado de XOR: ", 0

.code
main PROC
    ; 1. Operación AND lógico
    mov al, 00111100b              ; Carga un valor binario inicial en el registro AL
    and al, 00001111b              ; Aplica la compuerta AND bit a bit para enmascarar bits
    
    mov edx, OFFSET msgAnd         ; Carga la dirección del mensaje descriptivo para AND
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el contenido del registro AL en formato binario
    call Crlf                      ; Realiza un salto de línea

    ; 2. Operación OR lógico
    mov al, 00110000b              ; Carga un valor binario inicial en el registro AL
    or  al, 00001100b              ; Aplica la compuerta OR bit a bit para encender bits
    
    mov edx, OFFSET msgOr          ; Carga la dirección del mensaje descriptivo para OR
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el contenido del registro AL en formato binario
    call Crlf                      ; Realiza un salto de línea

    ; 3. Operación XOR lógico
    mov al, 00111100b              ; Carga un valor binario inicial en el registro AL
    xor al, 00110000b              ; Aplica la compuerta XOR bit a bit para alternar bits
    
    mov edx, OFFSET msgXor         ; Carga la dirección del mensaje descriptivo para XOR
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el contenido del registro AL en formato binario
    call Crlf                      ; Realiza un salto de línea

    exit
main ENDP
END main