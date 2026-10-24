; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     3 - Comparacion y prueba
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgMayor BYTE "El primer numero es mayor o igual al segundo.", 0
    msgMenor BYTE "El primer numero es menor que el segundo.", 0

.code
main PROC
    mov eax, 20                    ; Almacena el primer valor de prueba en EAX
    mov ebx, 15                    ; Almacena el segundo valor de prueba en EBX

    cmp eax, ebx                   ; Compara ambos valores 

    jge es_mayor                   ; Salta si el resultado indica que EAX es mayor o igual

    mov edx, OFFSET msgMenor       ; Carga el mensaje correspondiente a que el número es menor
    jmp mostrar                    ; Salta directamente a la sección de impresión

es_mayor:
    mov edx, OFFSET msgMayor       ; Carga el mensaje correspondiente a que es mayor o igual

mostrar:
    call WriteString               ; Imprime en consola el texto seleccionado por la condición

    exit
main ENDP
END main