.model tiny

.data
fname1 db 'name.txt', 0
fname2 db 'id.txt', 0
fname3 db 'splice.txt', 0
handle1 dw ?
handle2 dw ?
handle3 dw ?
name1 db 32H
len1 db ?
inp1 db 32H dup ('?')
id db 0EH
len2 db ?

inp2 db 0EH dup ('?')
str1 db "Enter your name: $"
str2 db "Enter your id: $"

msg1 db 40 DUP ('?')
.code
.startup

    LEA DX, str1
    MOV CX, 17H
    MOV AH, 09H
    INT 21H

    LEA DX, name1
    MOV AH, 0AH
    INT 21H

    MOV AH, 3CH
    LEA DX, fname1
    MOV CL, 1H
    INT 21H
    MOV handle1, AX

    MOV AH, 3DH
    MOV AL, 1H
    LEA DX, fname1
    INT 21H
    MOV handle1, AX

    MOV AH, 40H 
    MOV BX, handle1
    MOV CL, len1
    MOV CH, 00H
    LEA DX, inp1
    INT 21H

    MOV AH, 3EH 
    INT 21H

    MOV DX, 0AH
    MOV AH, 02H
    INT 21H

    LEA DX, str2
    MOV CX, 15H
    MOV AH, 09H
    INT 21H

    LEA DX, id
    MOV AH, 0AH
    INT 21H

    MOV AH, 3CH
    LEA DX, fname2
    MOV CL, 1H
    INT 21H
    MOV handle2, AX

    MOV AH, 3DH
    MOV AL, 1H
    LEA DX, fname2
    INT 21H
    MOV handle2, AX

    MOV AH, 40H 
    MOV BX, handle2
    MOV CL, len2
    MOV CH, 00H
    LEA DX, inp2
    INT 21H

    MOV AH, 3EH 
    INT 21H

    MOV AH, 3CH
    LEA DX, fname3
    MOV CL, 1H
    INT 21H
    MOV handle3, AX

    MOV AH, 3DH
    MOV AL, 1H
    LEA DX, fname3
    INT 21H
    MOV handle3, AX

    MOV AH, 40H
    MOV BX, handle3
    MOV CL, len1
    MOV CH, 00
    LEA DX, inp1
    INT 21H

    MOV AH, 40H 
    MOV BX, handle3
    MOV CL, len2
    MOV CH, 00
    LEA DX, inp2
    INT 21H

    MOV AH, 3EH
    INT 21H


.exit
end