; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     12 - Desplazamiento y rotacion
; *************************************************************************

INCLUDE Irvine32.inc

.data
    msgOriginal BYTE "Valor original en binario:  ", 0
    msgShl      BYTE "Desplazamiento a la izquierda (SHL): ", 0
    msgShr      BYTE "Desplazamiento a la derecha (SHR):  ", 0
    msgRol      BYTE "Rotacion a la izquierda (ROL):      ", 0

.code
main PROC
    ; 1. Mostrar valor original
    mov al, 00011001b              ; Carga un valor binario inicial en el registro AL
    
    mov edx, OFFSET msgOriginal    ; Carga la dirección del mensaje descriptivo original
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el contenido del registro AL en formato binario
    call Crlf                      

    ; 2. Desplazamiento a la izquierda (SHL)
    mov al, 00011001b              ; Carga nuevamente el valor de prueba en AL
    shl al, 1                      ; Desplaza todos los bits una posición a la izquierda (multiplica por 2)
    
    mov edx, OFFSET msgShl         ; Carga la dirección del mensaje para SHL
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el resultado binario en consola
    call Crlf                      

    ; 3. Desplazamiento a la derecha (SHR)
    mov al, 00011001b              ; Carga nuevamente el valor de prueba en AL
    shr al, 1                      ; Desplaza todos los bits una posición a la derecha (divide entre 2)
    
    mov edx, OFFSET msgShr         ; Carga la dirección del mensaje para SHR
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el resultado binario en consola
    call Crlf                      

    ; 4. Rotación a la izquierda (ROL)
    mov al, 10000001b              ; Carga un valor con bits en los extremos para apreciar la rotación
    rol al, 1                      ; Rota los bits a la izquierda, reubicando el bit que sale en el extremo opuesto
    
    mov edx, OFFSET msgRol         ; Carga la dirección del mensaje para ROL
    call WriteString               ; Imprime el texto en la consola
    call WriteBin                  ; Muestra el resultado binario en consola
    call Crlf                      

    exit
main ENDP
END main