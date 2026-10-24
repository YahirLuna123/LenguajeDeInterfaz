; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     13 - String hexadecimal
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgPrompt    BYTE "Ingresa un valor hexadecimal: ", 0
    msgResultado BYTE "El valor mostrado en formato hexadecimal es: ", 0

.code
main PROC
    mov edx, OFFSET msgPrompt      
    call WriteString               ; Imprime la solicitud del número en la consola

    call ReadHex                   ; Lee un número en formato hexadecimal desde el teclado (almacenándolo en EAX)

    mov edx, OFFSET msgResultado   ; Carga la dirección del texto que encabeza el resultado
    call WriteString               ; Imprime el mensaje de resultado en pantalla

    call WriteHex                  ; Muestra en la consola el valor numérico actual de EAX en formato hexadecimal

    exit
main ENDP
END main