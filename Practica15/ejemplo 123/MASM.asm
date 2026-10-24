; *************************************************************************
;               Instituto Tecnologico de Culiacan
;
; Alumno:       Yahir Luna Beltran
; Materia:      Lenguaje de Interfaz
; Horario:      10-11
; Docente:      Dr. José Luis Medina Jiménez
; Práctica:     15 - Manipulacion de datos
; *************************************************************************

INCLUDE Irvine32.inc

.data
    filename        BYTE "datos.txt", 0            ; Nombre del archivo de texto a manipular
    fileHandle      DWORD ?                        ; Variable para almacenar el manejador (handle) del archivo
    msgEscribe      BYTE "Escribiendo datos en el archivo...", 0
    msgLee          BYTE "Leyendo datos desde el archivo:", 0
    bufferEscritura BYTE "Prueba de escritura en archivo TXT - Ensamblador.", 0
    tamanoEscritura = ($ - bufferEscritura) - 1    ; Calcula la longitud exacta del texto a escribir
    bufferLectura   BYTE 100 DUP(0)                ; Buffer auxiliar para almacenar los datos leídos del archivo

.code
main PROC
    ; 1. Crear y abrir el archivo para escritura
    mov edx, OFFSET filename       ; Carga la dirección del nombre del archivo
    call CreateOutputFile          ; Crea o sobrescribe el archivo y retorna el manejador en EAX
    mov fileHandle, eax            ; Guarda el manejador del archivo en memoria

    ; 2. Escribir texto dentro del archivo
    mov edx, OFFSET msgEscribe     ; Carga el mensaje de estado de escritura
    call WriteString               ; Imprime el mensaje informativo en la consola
    call Crlf                      ; Realiza un salto de línea

    mov eax, fileHandle            ; Carga el manejador del archivo en EAX
    mov edx, OFFSET bufferEscritura; Carga la dirección del texto fuente a escribir
    mov ecx, tamanoEscritura       ; Especifica el número de bytes que se van a escribir
    call WriteToFile               ; Escribe los datos binarios/texto en el archivo físico

    ; 3. Cerrar el archivo después de la escritura
    mov eax, fileHandle            ; Carga el manejador del archivo
    call CloseFile                 ; Cierra el flujo de escritura del archivo

    ; 4. Abrir el archivo en modo de lectura
    mov edx, OFFSET filename       ; Carga el nombre del archivo a abrir
    call OpenInputFile             ; Abre el archivo existente para lectura y retorna el manejador en EAX
    mov fileHandle, eax            ; Actualiza el manejador en la variable

    mov edx, OFFSET msgLee         ; Carga el mensaje indicador de lectura
    call WriteString               ; Muestra el texto en la consola
    call Crlf                      ; Salto de línea

    ; 5. Leer los datos desde el archivo hacia el buffer en memoria
    mov eax, fileHandle            ; Carga el manejador del archivo abierto
    mov edx, OFFSET bufferLectura  ; Apunta al buffer donde se depositará la información leída
    mov ecx, SIZEOF bufferLectura  ; Define el tamaño máximo de bytes a leer
    call ReadFromFile              ; Lee el contenido del archivo y lo guarda en el buffer

    ; 6. Imprimir en consola el contenido recuperado del archivo
    mov edx, OFFSET bufferLectura  ; Carga la dirección del buffer con los datos leídos
    call WriteString               ; Despliega el texto recuperado del archivo TXT en la pantalla
    call Crlf                      ; Salto de línea final

    ; 7. Cerrar el archivo final
    mov eax, fileHandle            ; Carga el manejador activo
    call CloseFile                 ; Cierra el archivo para liberar los recursos del sistema

    exit
main ENDP
END main