; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     1 - Ciclos numéricos
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgInfo BYTE "Imprimiendo secuencia numerica:", 0

.code
main PROC
    mov edx, OFFSET msgInfo        ; Carga la dirección del mensaje inicial
    call WriteString               ; Imprime el texto en la consola

    mov ecx, 5                     ; Establece el número de iteraciones del ciclo
    mov eax, 1                     ; Define el valor inicial de la secuencia numérica

ciclo_numeros:
    call WriteDec                  ; Imprime el valor numérico decimal actual en EAX
    inc eax                        ; Incrementa en uno el valor
    loop ciclo_numeros             ; Decrementa ECX y repite el salto si aún no es cero

    exit
main ENDP
END main