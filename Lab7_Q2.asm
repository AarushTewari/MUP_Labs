.model tiny
.data

    msg1    db "Please enter the Username: $:"

    maxu1    db 20 

    actu1    db ?

    inpu1    db 20 dup ("$") 


    maxu2    db 20 

    actu2    db ?

    inpu2    db 20 dup ("$")

    fname1    db "username.txt", 0 
    handle1 dw ?

    fname2    db "password.txt", 0 
    handle2 dw ?

    msg2    db "enter your password: $" 

    maxp1 db 30

    actp1 db ?

    inpp1    db 30 dup ("$") 

    maxp2 db 30

    actp2 db ?

    inpp2    db 30 dup ("$") 

    msg3    db "hello $" 

    msg4    db "wrong username$" 

    msg5    db "wrong password$" 
    
    msg6    db "How Long is your Username?: $"

    msg7    db "How Long is your Password?: $"

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
    mov cl, maxu1
    mov ch, 0
    lea dx, inpu1
    int 21h

    mov ah, 3eh
    int 21h
    lea dx, msg1
    mov ah, 09h
    int 21h
    lea dx, maxu2
    mov ah, 0Ah
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
    cld
    lea di, inpu1
    lea si, inpu2
    mov cx, 11
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
    lea dx, msg2
    mov ah, 09h
    int 21h

l1: mov ah, 3dh
    mov al, 0h
    lea dx, fname2
    int 21h
    mov handle2, ax

    mov ah, 3fh
    mov bx, handle2
    mov cl, maxp1
    mov ch, 0
    lea dx, inpp1
    int 21h

    mov ah, 3eh
    int 21h
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov cx, 30
    lea di, inpp2
l2: mov ah, 08h
    int 21h
    mov [di], al
    mov dl, '*'
    mov ah, 02h
    int 21h
    mov bl, '$'
    cmp [di], bl
    jz endLoop
    inc di
    dec cx
    jnz l2
endLoop:
    cld
    mov cx, 6
    lea di, inpp2
    lea si, inpp1
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
    lea dx, inpu1
    mov ah, 09h
    int 21h
    lea dx, nline
    mov ah, 09h
    int 21h
l4:
.exit
end