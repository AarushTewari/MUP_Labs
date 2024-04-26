.model tiny
.data
dat1 db 'wasitaatisaw'
dat1length db 0ch
res dw 00h
.code
.startup
    LEA DI, dat1
    MOV SI, DI
    ADD DI, 0BH
    LEA BX, res
    MOV CL, dat1length
LOGIC:
    CLD
    LODSB 
    STD
    SCASB
    JNZ not_palindrome
    DEC CL
    JNZ LOGIC
    MOV BYTE PTR [BX], 01h
not_palindrome:
    

.exit
end