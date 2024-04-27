.model tiny
.data

    msg1    db "enter 10 character long User Name: $"

    usn1    db "anub@g.com$" 

    max1    db 20 

    act1    db ?

    inp1    db 20 dup ("$") 

    fname1    db "username.txt", 0 

    handle1 dw ?

    fname2    db "password.txt", 0 

    handle2 dw ?

    msg2    db "enter 5 character long password:$" 

    pass1   db "oscar" 

    inp2    db 30 dup ("$") 

    msg3    db "hello $" 

    msg4    db "wrong username$" 

    msg5    db "wrong password$" 

    nline   db 0ah, 0dh, "$" 

.code
.startup
    mov ah, 3dh
    mov al, 0h
    lea dx, fname1
    int 21h
    mov handle1, ax

    mov ah, 3fh
    mov bx, handle1
    mov cx, 11h
    lea dx, inp1
    int 21h

    mov ah, 3eh
    int 21h
    cld
    lea di, inp1
    lea si, usn1
    mov cx, 10
    repe cmpsb
    jcxz l1
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg4
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h
l1: mov ah, 3dh
    mov al, 0h
    lea dx, fname2
    int 21h
    mov handle2, ax

    mov ah, 3fh
    mov bx, handle2
    mov cx, 11h
    lea dx, inp2
    int 21h

    mov ah, 3eh
    int 21h
    cld
    mov cx, 6
    lea di, inp2
    lea si, pass1
    repe cmpsb
    jcxz l3
    lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg5
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h
    
l3: lea dx, nline
    mov ah, 09h
    int 21h
    lea dx, msg3
    mov ah, 09h
    int 21h
    lea dx, usn1
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
.exit
end