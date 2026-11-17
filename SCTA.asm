;***************************************************************
; Galaviz Ulloa Aaron - 5A
; Gonzalez Llanos Jeikob Xaiver - 5A
; Cortes Hidalgo Carlos David - 5A
;
; GUARDAR COMO: SCTA.asm   (todos los .txt en la MISMA carpeta)
;**************************************************************

INCLUDE BIBLIOTECA.txt        ; SOLO macros (no generan bytes, pueden ir arriba)

.MODEL SMALL
.STACK
.DATA

    ; 1. Logo
    logo1  db ' |\_   _/| ' ;11
    logo2  db '||  \ /  ||'
    logo3  db '||   |   ||'
    logo4  db '|_\__|__/_|'
    logo5  db '   \___/   '

    ; 3. Titulo Principal
    titulo1  db '  ____   ____   ___  _   _   ____  ___  ____      _     _       ' ;64
    titulo2  db ' |  _ \ |  _ \ |_ _|| \ | | / ___||_ _||  _ \    / \   | |      ' ;64
    titulo3  db ' | |_) || |_) | | | |  \| || |     | | | |_) |  / _ \  | |      ' ;64
    titulo4  db ' |  __/ |  _ <  | | | |\  || |___  | | |  __/  / ___ \ | |___   ' ;64
    titulo5  db ' |_|    |_| \_\|___||_| \_| \____||___||_|    /_/   \_\|_____|  ' ;64

    msjInst   DB '======== Seleccione la opcion deseada [ ] ========' ;50

    msjOp1_1  DB ' ----------------- '; 19
    msjOp1_2  DB '|                 |'; 19
    msjOp1_3  DB '|                 |'; 19
    msjOp1_4  DB '|  1.Registro de  |'; 19
    msjOp1_5  DB '|      datos      |'; 19
    msjOp1_6  DB '|                 |'; 19
    msjOp1_7  DB ' ----------------- '; 19

    msjOp2_1  DB ' ----------------- '; 19
    msjOp2_2  DB '|                 |'; 19
    msjOp2_3  DB '|                 |'; 19
    msjOp2_4  DB '|   2.Consulta    |'; 19
    msjOp2_5  DB '|     Termica     |'; 19
    msjOp2_6  DB '|                 |'; 19
    msjOp2_7  DB ' ----------------- '; 19

    msjOp3_1  DB ' ----------------- '; 19
    msjOp3_2  DB '|                 |'; 19
    msjOp3_3  DB '|                 |'; 19
    msjOp3_4  DB '|   3.Archivos    |'; 19
    msjOp3_5  DB '|    (Pruebas)    |'; 19
    msjOp3_6  DB '|                 |'; 19
    msjOp3_7  DB ' ----------------- '; 19

    msjOp4_1  DB ' ----------------- '; 19
    msjOp4_2  DB '|                 |'; 19
    msjOp4_3  DB '|                 |'; 19
    msjOp4_4  DB '|  4.Seven Seg.   |'; 19
    msjOp4_5  DB '|                 |'; 19
    msjOp4_6  DB '|                 |'; 19
    msjOp4_7  DB ' ----------------- '; 19

    msjOp5_1  DB ' ----------------- '; 19
    msjOp5_2  DB '|                 |'; 19
    msjOp5_3  DB '|                 |'; 19
    msjOp5_4  DB '|  5.Dot Matrix   |'; 19
    msjOp5_5  DB '|                 |'; 19
    msjOp5_6  DB '|                 |'; 19
    msjOp5_7  DB ' ----------------- '; 19

    msjOp6_1  DB ' ----------------- '; 19
    msjOp6_2  DB '|                 |'; 19
    msjOp6_3  DB '|                 |'; 19
    msjOp6_4  DB '|   6.Reportes    |'; 19
    msjOp6_5  DB '|                 |'; 19
    msjOp6_6  DB '|                 |'; 19
    msjOp6_7  DB ' ----------------- '; 19

    msjOp7_1  DB ' ----------------- '; 19
    msjOp7_2  DB '|                 |'; 19
    msjOp7_3  DB '|                 |'; 19
    msjOp7_4  DB '|     7.Salir     |'; 19
    msjOp7_5  DB '|                 |'; 19
    msjOp7_6  DB '|                 |'; 19
    msjOp7_7  DB ' ----------------- '; 19

    msjOp8_1  DB ' ----------------- '; 19
    msjOp8_2  DB '|                 |'; 19
    msjOp8_3  DB '|                 |'; 19
    msjOp8_4  DB '|   8.Acerca de   |'; 19
    msjOp8_5  DB '|                 |'; 19
    msjOp8_6  DB '|                 |'; 19
    msjOp8_7  DB ' ----------------- '; 19

    Opcion DB 0
    ID DW 0    ; Identificador de archivo, global para todo el proyecto
    msjPie  DB ' Equipo: Galaviz, Gonzalez, Cortes | Lenguajes de Interfaz 5-A | SCTA v1.0      ' ;80

    ; ---- Datos de cada pantalla (INCLUDE = copiar y pegar aqui) ----
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Acerca_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\FormDatos_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Reportes_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Carpetas_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Util_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Login_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Consulta_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\Archivos_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\SevenSegmentAcceso_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\DotMatrixAccess_D.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Datos\AgregarCuenta_D.txt

.CODE
inicio:
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    CALL PROC_CREAR_CARPETAS    ; Crea carpeta raiz y de integrantes (si ya existen, continua)
    CALL PROC_LOGIN             ; AL=1 acceso concedido, AL=0 salir
    CMP AL,0
    JNE PANTALLA
    JMP FIN

PANTALLA:
    CALL CLEAN_SCREEN

    ; 2. Imprimir logo en esquina
    IMPCAP_CONCOLOR logo1,11,1,1,0,0,0AH
    IMPCAP_CONCOLOR logo2,11,2,1,0,0,0AH
    IMPCAP_CONCOLOR logo3,11,3,1,0,0,0AH
    IMPCAP_CONCOLOR logo4,11,4,1,0,0,0AH
    IMPCAP_CONCOLOR logo5,11,5,1,0,0,0AH

    ; 3. Imprimir titulo
    IMPCAP_CONCOLOR titulo1,64,1,13,0,0,0AH
    IMPCAP_CONCOLOR titulo2,64,2,13,0,0,0AH
    IMPCAP_CONCOLOR titulo3,64,3,13,0,0,0AH
    IMPCAP_CONCOLOR titulo4,64,4,13,0,0,0AH
    IMPCAP_CONCOLOR titulo5,64,5,13,0,0,0AH

    ; 4. Instrucciones
    IMPCAP_CONCOLOR msjInst,50,7,13,0,0,0EH

    ; 5. Opcion 1
    IMPCAP_CONCOLOR msjOp1_1,19,9, 1,0,0,0AH
    IMPCAP_CONCOLOR msjOp1_2,19,10,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp1_3,19,11,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp1_4,19,12,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp1_5,19,13,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp1_6,19,14,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp1_7,19,15,1,0,0,0AH

    ; 6. Opcion 2
    IMPCAP_CONCOLOR msjOp2_1,19,9, 21,0,0,0AH
    IMPCAP_CONCOLOR msjOp2_2,19,10,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp2_3,19,11,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp2_4,19,12,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp2_5,19,13,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp2_6,19,14,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp2_7,19,15,21,0,0,0AH

    ; 7. Opcion 3
    IMPCAP_CONCOLOR msjOp3_1,19,9, 41,0,0,0AH
    IMPCAP_CONCOLOR msjOp3_2,19,10,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp3_3,19,11,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp3_4,19,12,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp3_5,19,13,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp3_6,19,14,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp3_7,19,15,41,0,0,0AH

    ; 8. Opcion 4
    IMPCAP_CONCOLOR msjOp4_1,19,9, 61,0,0,0AH
    IMPCAP_CONCOLOR msjOp4_2,19,10,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp4_3,19,11,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp4_4,19,12,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp4_5,19,13,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp4_6,19,14,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp4_7,19,15,61,0,0,0AH

    ; 9. Opcion 5
    IMPCAP_CONCOLOR msjOp5_1,19,17,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp5_2,19,18,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp5_3,19,19,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp5_4,19,20,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp5_5,19,21,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp5_6,19,22,1,0,0,0AH
    IMPCAP_CONCOLOR msjOp5_7,19,23,1,0,0,0AH

    ; 10. Opcion 6
    IMPCAP_CONCOLOR msjOp6_1,19,17,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp6_2,19,18,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp6_3,19,19,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp6_4,19,20,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp6_5,19,21,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp6_6,19,22,21,0,0,0AH
    IMPCAP_CONCOLOR msjOp6_7,19,23,21,0,0,0AH

    ; 11. Opcion 7
    IMPCAP_CONCOLOR msjOp7_1,19,17,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp7_2,19,18,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp7_3,19,19,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp7_4,19,20,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp7_5,19,21,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp7_6,19,22,41,0,0,0AH
    IMPCAP_CONCOLOR msjOp7_7,19,23,41,0,0,0AH

    ; 12. Opcion 8
    IMPCAP_CONCOLOR msjOp8_1,19,17,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp8_2,19,18,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp8_3,19,19,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp8_4,19,20,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp8_5,19,21,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp8_6,19,22,61,0,0,0AH
    IMPCAP_CONCOLOR msjOp8_7,19,23,61,0,0,0AH

    ; 13. Pie de pagina
    IMPCAP_CONCOLOR msjPie,80,24,0,0,0,2FH

LEER_TECLA:
    CURSOR 7,52,0           
    MOV AH,1               
    INT 21H
    MOV OPCION,AL

comparacion:
    CMP OPCION,'1'
    JNE no_1
    CALL PROC_FORMDATOS
    JMP PANTALLA
no_1:
    CMP OPCION,'2'
    JNE no_2
    CALL PROC_CONSULTA
    JMP PANTALLA
no_2:
    CMP OPCION,'3'
    JNE no_3
    CALL PROC_ARCHIVOS
    JMP PANTALLA
no_3:
    CMP OPCION,'4'
    JNE no_4
    CALL PROC_SEVENSEG
    JMP PANTALLA
no_4:
    CMP OPCION,'5'
    JNE no_5
    CALL PROC_DOTMATRIX
    JMP PANTALLA
no_5:
    CMP OPCION,'6'
    JNE no_6
    CALL PROC_REPORTES
    JMP PANTALLA
no_6:
    CMP OPCION,'7'
    JE FIN
    CMP OPCION,'8'
    JNE no_8
    CALL PROC_ACERCA
    JMP PANTALLA
no_8:
    JMP LEER_TECLA

FIN:
    MOV AX,4C00H
    INT 21H
    
TECLA PROC
    MOV AH,0
    INT 16H
    RET
TECLA ENDP

CLEAN_SCREEN PROC
    MOV AH,6
    MOV AL,0
    MOV CH,0
    MOV CL,0
    MOV DH,24
    MOV DL,79
    MOV BH,0AH              
    INT 10H
    RET
CLEAN_SCREEN ENDP

; ---- Procedimientos ----  
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Util_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Acerca_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\FormDatos_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Reportes_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Carpetas_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\AgregarCuenta_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Login_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Consulta_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\Archivos_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\SevenSegmentAcceso_C.txt
    INCLUDE C:\emu8086\vdrive\C\ProyectoSCTA\Codigo\DotMatrixAccess_C.txt

END inicio