.model tiny

.data
is_a db "The character entered is a$"
is_not_a db "The character entered is not a$"

.code
.startup
MOV AX, 00H
MOV AH, 08H
INT 21h

CMP AL, 61h
JZ a_found
LEA DX, is_not_a
MOV CX, 30H
MOV AH, 09H
INT 21h

JMP TERM
a_found:
    LEA DX, is_a
    MOV CX, 26H
    MOV AH, 09H
    INT 21h

TERM:
.EXIT
END
