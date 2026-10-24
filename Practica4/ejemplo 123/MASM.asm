; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     4 - Saltos
; *************************************************************************
INCLUDE Irvine32.inc

.data
    msgInicio BYTE "Inicio del programa.", 0
    msgMedio  BYTE "Este mensaje se deberia saltar.", 0
    msgFinal  BYTE "Fin del programa (salto exitoso).", 0

.code
main PROC
    mov edx, OFFSET msgInicio      ; Carga la dirección del mensaje inicial
    call WriteString               ; Imprime el texto inicial en la consola

    jmp saltar_aqui                ; Salto incondicional que evita la ejecución del bloque intermedio

    mov edx, OFFSET msgMedio       ; Carga el mensaje intermedio
    call WriteString               ; Esta sección se omite por el salto

.code
saltar_aqui:
    mov edx, OFFSET msgFinal       ; Carga la dirección del mensaje final
    call WriteString               ; Imprime el mensaje final en la consola

    exit
main ENDP
END main