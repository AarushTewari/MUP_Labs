.model tiny

.data
array1 db 80h, 12h, 15h, 78h, 90h
count db 05h
NEG1 db ?

.code
.startup
LEA DI, array1
MOV CL, count
LEA SI, NEG1
MOV AL, 00H
MAIN:
    CMP BYTE PTR [DI], 00H
    JG POSITIVE
    INC AL
    INC DI
    DEC CX
    JNZ MAIN
    JZ TERM

POSITIVE:
    INC DI
    DEC CX
    JNZ MAIN

TERM:
    MOV BYTE PTR[SI], AL
    .exit

end