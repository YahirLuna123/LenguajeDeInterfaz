; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     14 - Captura y almacenamiento de datos numericos
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgPrompt    BYTE "Ingresa un numero entero: ", 0
    msgGuardado  BYTE "El numero guardado en memoria es: ", 0
    numeroAlmacenado SDWORD ?              ; Declara una variable en memoria para almacenar el valor numérico

.code
main PROC
    mov edx, OFFSET msgPrompt      ; Carga la dirección del mensaje que solicita el número
    call WriteString               ; Imprime la solicitud del número en la consola

    call ReadInt                   ; Lee un número entero desde el teclado en la consola
    mov numeroAlmacenado, eax      ; Almacena el valor numérico proveniente de EAX en la variable de memoria

    mov edx, OFFSET msgGuardado    ; Carga la dirección del texto que encabeza el resultado
    call WriteString               ; Imprime el mensaje de confirmación en la pantalla

    mov eax, numeroAlmacenado      ; Recupera y carga el valor numérico guardado en memoria de regreso a EAX
    call WriteInt                  ; Muestra en la consola el valor entero almacenado

    exit
main ENDP
END main