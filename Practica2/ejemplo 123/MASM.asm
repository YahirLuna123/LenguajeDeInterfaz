; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     2 - Captura y desplegado de mensaje
; *************************************************************************

INCLUDE Irvine32.inc

.data
    prompt    BYTE "Ingresa un texto o mensaje: ", 0
    resultado BYTE "Mensaje capturado: ", 0
    buffer    BYTE 50 DUP(0)     ; Reserva espacio en memoria para almacenar la cadena ingresada

.code
main PROC
    mov edx, OFFSET prompt         ; Carga el mensaje que solicita el texto al usuario
    call WriteString               ; Muestra la solicitud en la consola

    mov edx, OFFSET buffer         ; Apunta a la dirección del buffer de almacenamiento
    mov ecx, SIZEOF buffer         ; Define el tamaño máximo de caracteres permitidos
    call ReadString                ; Captura la cadena ingresada desde el teclado

    mov edx, OFFSET resultado      ; Carga el texto que encabeza el resultado
    call WriteString               ; Imprime el encabezado en pantalla

    mov edx, OFFSET buffer         ; Apunta nuevamente al buffer con el texto guardado
    call WriteString               ; Despliega el mensaje exacto que ingresó el usuario

    exit
main ENDP
END main