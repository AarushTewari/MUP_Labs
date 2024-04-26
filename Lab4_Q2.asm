.model tiny
.data
string1 db 'BITSIOTLAB'
string2 db 'IOT'
string1length db 0ah

.code
.startup
LEA DI, string1
MOV SI, DI
ADD SI, 0AH
SUB SI, 03H
MOV CL, string1length
MOV CH, 00H
mov AX, 'OI'
CLD
REPNE SCASW
SUB DI, 02H
MOV BYTE PTR [DI], '*'
INC DI
MOVSB
MOVSB
MOVSB
.exit
end