.model tiny

.data
cnt db 08h
.code 
.startup

    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV CL, cnt
    MOV CH, 00
    MOV SI, 01
    MOV DI, 01
    MOV DH, 00H

    WRITE1:
    PUSH CX
    
    MOV AH, 02H
    MOV DL, 00H
    MOV BH, 00H
    INT 10H

    MOV AX, SI
    ADD AL, 64
    MOV AH, 09H
    MOV BH, 00H
    MOV BL, 00001111B
    MOV CX, SI
    INT 10H
    POP CX

    MOV BP, DI
    ADD DI, SI
    MOV SI, BP
    INC DH
    DEC CL
    JNZ WRITE1

    END1:
        MOV AH, 07H
        INT 21H
        CMP AL, '%'
        JNZ END1

.exit
end