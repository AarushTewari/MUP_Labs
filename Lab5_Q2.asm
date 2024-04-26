.model tiny

.data
max1 db 32h
act1 db ?
inp1 db 32H (0)

.code
.startup
MOV AX, 00H
LEA DX, max1
MOV AH, 0AH
INT 21H

LEA BX, inp1
MOV CL, act1
CONVERT:
    MOV CH, [BX]
    SUB CH, 20H
    MOV [BX], CH
    INC BX
    DEC CL
    JNZ CONVERT

MOV AX, 00H
LEA DX, inp1
MOV CL, act1
MOV CH, 00
MOV AH, 09H
INT 21H

.EXIT
END

