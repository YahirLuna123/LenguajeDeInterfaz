; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Practica:     6 - Contadol de ocupación de un estacionamiento
; *************************************************************************
INCLUDE Irvine32.inc

.data
    CAPACIDAD       DWORD 5         ; Capacidad máxima del estacionamiento
    autosActuales   DWORD 0         ; Contador de autos actuales en memoria

    msgMenu         BYTE 13, 10, "1 = Entra auto, 2 = Sale auto, 0 = Salir: ", 0
    msgLleno        BYTE "Estacionamiento LLENO.", 0
    msgLugares      BYTE "Hay lugares disponibles.", 0
    msgAutoEntro    BYTE "Un auto ha ingresado.", 0
    msgAutoSalio    BYTE "Un auto ha salido.", 0
    msgActual       BYTE " Autos actualmente dentro: ", 0

.Code
main PROC

ciclo_estacionamiento:
    mov edx, OFFSET msgActual       ; Mostrar cuántos autos hay actualmente
    call WriteString
    mov eax, autosActuales
    call WriteDec
    call Crlf

    mov eax, autosActuales           ; Validar si está lleno o hay lugares para mostrar en pantalla
    cmp eax, CAPACIDAD
    jge es_lleno
    
    mov edx, OFFSET msgLugares
    call WriteString
    call Crlf
    jmp pedir_opcion

es_lleno:
    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf

pedir_opcion:
    ; Mostrar menú: 1=Entra, 2=Sale
    mov edx, OFFSET msgMenu
    call WriteString
    call ReadInt           ; Lee la opción del usuario en EAX

    cmp eax, 0
    je salir               ; Si ingresa 0, termina el programa
    cmp eax, 1
    je entra_auto          ; Si ingresa 1, entra un auto
    cmp eax, 2
    je sale_auto           ; Si ingresa 2, sale un auto
    
    jmp ciclo_estacionamiento

entra_auto:
    mov eax, autosActuales      ; Verificar si ya llegó al límite antes de incrementar
    cmp eax, CAPACIDAD
    jge ciclo_estacionamiento

    inc autosActuales      ; Incrementa el contador de autos
    mov edx, OFFSET msgAutoEntro
    call WriteString
    call Crlf
    jmp ciclo_estacionamiento

sale_auto:
    mov eax, autosActuales      ; Verificar que no esté en 0 antes de decrementar
    cmp eax, 0
    jle ciclo_estacionamiento

    dec autosActuales      ; Decrementa el contador de autos (DEC)
    mov edx, OFFSET msgAutoSalio
    call WriteString
    call Crlf
    jmp ciclo_estacionamiento

salir:
    exit
main ENDP
END main