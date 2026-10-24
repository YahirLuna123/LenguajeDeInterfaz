; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     8 - Operaciones Aritméticas
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgSuma BYTE "Operaciones aritmeticas ejecutadas con exito.", 0

.code
main PROC
    mov eax, 50
    mov ebx, 20
                         ;Operaciones de suma y resta de lo guadado en EAX Y EBX
    add eax, ebx         ; EAX = 50 + 20 = 70
    sub eax, 15          ; EAX = 70 - 15 = 55

    mov eax, 25
    mov ebx, 3
                         ;Opreracion de multiplicacion
    mul ebx              ; Multiplica EAX por EBX. 

    call WriteDec        ; Muestra el resultado de la multiplicación

    exit
main ENDP
END main