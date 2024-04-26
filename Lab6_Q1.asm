.model tiny

.data
str1 db "Enter your name: $"
max1 db 32
act1 db ?
inp1 db 32 dup('$')
fname db 'testing.txt', 0
handle dw ?

.code 
.startup
    LEA DX, str1
    MOV CX, 17H
    MOV AH, 09H
    INT 21H

    LEA DX, max1
    MOV AH, 0AH
    INT 21H

    ;CREATE FILE
    MOV AH, 3CH
    LEA DX, fname
    MOV CL, 1H
    INT 21H
    MOV handle, AX
    
    ;OPEN FILE
    MOV AH, 3DH
    MOV AL, 1H
    LEA DX, fname
    INT 21H
    MOV handle, AX

    ;WRITE
    MOV AH, 40H 
    MOV BX, handle
    MOV CL, act1
    MOV CH, 00
    LEA DX, inp1
    INT 21H

    ;CLOSE FILE
    MOV AH, 3EH
    INT 21H

.EXIT
END