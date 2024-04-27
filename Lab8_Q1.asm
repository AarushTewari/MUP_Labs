.model tiny

.data
inp1 db "Aarush Tewari"
colmstr dw ?
cnt db 0DH

.code 
.startup
MOV AH, 00H
MOV AL, 03H
INT 10H

LEA SI, inp1
LEA DI, cnt
MOV CH, 00H
MOV CL, [DI]
MOV colmstr, 0DH
LEA DI, colmstr

WRITE:
    PUSH CX

    MOV AH, 02H
    MOV DL, [DI]
    MOV DH, [DI]
    MOV BH, 00
    INT 10H

    MOV AH, 09H
    MOV AL, [SI]
    MOV BH, 00H
    MOV BL, 00001111B
    MOV CX, 01
    INT 10H
    POP CX
    INC SI
    DEC WORD PTR[DI]
    DEC CL
    JNZ WRITE

    END1:
    MOV AH, 07H
    INT 21H
    CMP AL, "%"
    JNZ END1

    TERM:
    MOV AH, 4CH
    INT 21H

.exit
end
