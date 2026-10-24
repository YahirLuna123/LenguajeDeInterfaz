; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     10 - Cadena con decimal
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgPrompt    BYTE "Ingresa un numero con decimales: ", 0
    msgResultado BYTE "El numero decimal ingresado es: ", 0

.code
main PROC
    mov edx, OFFSET msgPrompt      ; Carga la dirección del mensaje que solicita el valor
    call WriteString               ; Imprime la solicitud del número en la consola

    call ReadFloat                 ; Lee un número de punto flotante desde el teclado (se almacena en el coprocesador ST(0))

    mov edx, OFFSET msgResultado   ; Carga la dirección del texto que encabeza el resultado
    call WriteString               ; Imprime el mensaje de resultado en pantalla

    call WriteFloat                ; Escribe y formatea el número decimal almacenado en ST(0) hacia la consola
    call Crlf                      ; Realiza un salto de línea final

    exit
main ENDP
END main    