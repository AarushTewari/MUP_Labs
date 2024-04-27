.model tiny

.data
char db ?
fname1 db "Lab1.txt", 0
handle1 dw ?
inp1 db 13 dup ('?')

rowstart dw 0
rowend dw 19
colstart dw 0
colend dw 640
width1 dw 19
cnt db 00h

.code
.startup

MOV AH, 08H
INT 21H
MOV char, AL

MOV AH, 3DH
MOV AL, 0H
LEA DX, fname1
INT 21H
MOV handle1, AX

MOV AH, 3FH
MOV BX, handle1
MOV CX, 13
LEA DX, inp1
INT 21H

MOV AH, 3EH
INT 21H


MOV AH, 00H
    MOV AL, 12H
INT 10H

MOV AH, 02H
MOV DH, 20
MOV DL, 20
MOV BH, 00
INT 10H

LEA SI, inp1
ADD SI, 11
MOV AL, char
CMP AL, [SI]
MOV CX, 25
JNZ purple_first
JZ green_first
green_first:

    mov si, rowstart
    PUSH CX
    COLM1:
        MOV CX, colend
        ROW1:
            DEC CX
            MOV DI, CX
            PUSH CX
            MOV AH, 0CH
            MOV AL, 0010B
            MOV CX, DI
            MOV DX, SI
            INT 10H
            POP CX
            CMP CX, colstart
            JNZ ROW1
            INC SI
            MOV AX, rowend
            CMP SI, AX
            JNZ COLM1

            MOV AX, width1
            ADD rowstart, AX
            ADD rowend, AX

            POP CX
            DEC CX
            JZ TERM

purple_first: 
    mov si, rowstart
    PUSH CX
    COLM2:
        MOV CX, colend
        ROW2:
            DEC CX
            MOV DI, CX
            PUSH CX
            MOV AH, 0CH
            MOV AL, 0101B
            MOV CX, DI
            MOV DX, SI
            INT 10H
            POP CX
            CMP CX, colstart
            JNZ ROW2
            INC SI
            MOV AX, rowend
            CMP SI, AX
            JNZ COLM2

            MOV AX, width1
            ADD rowstart, AX
            ADD rowend, AX

            POP CX
            DEC CX
            JZ TERM
            JNZ green_first

TERM:
.EXIT
END