; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     7 - Uso de la pila (PUSH y POP)
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgPrompt   BYTE "Ingresa un caracter (solo digitos del 0 al 9): ", 0
    msgValido   BYTE "Formato correcto: Es un digito numerico valido.", 0
    msgInvalido BYTE "Error: Formato invalido. No es un digito.", 0

.code
main PROC
    mov edx, OFFSET msgPrompt       ; Pide un carácter al usuario
    call WriteString
    
    call ReadChar        ; Leer un carácter desde la consola
    call WriteChar       ; Mostramos el carácter presionado en pantalla
    call Crlf

    cmp al, '0'          ; Verifica si el carácter está en el rango ASCII de '0' a '9'

    jl formato_invalido  ; Si es menor que '0', no es válido
    
    cmp al, '9'
    jg formato_invalido  ; Si es mayor que '9', no es válido

    mov edx, OFFSET msgValido   ;imrpime mensaje si es valido y salta
    call WriteString
    call Crlf
    jmp fin

formato_invalido:
    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf

fin:
    exit
main ENDP
END main