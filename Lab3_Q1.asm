.model tiny

.data

array1 db 91h, 02h, 083h, 0Ah, 075h, 0Ah, 047h, 012h, 076h, 61h
array_length db 0Ah

.code
.startup

LEA DI, array1
MOV CL, array_length
MAIN:
    CMP BYTE PTR [DI], 0Ah
    JZ FOUND
    INC DI
    DEC CL
    JNZ MAIN
    JZ TERM
FOUND:
    MOV BYTE PTR [DI], 45h
    INC DI
    DEC CL
    JNZ MAIN

TERM:
    .exit
end