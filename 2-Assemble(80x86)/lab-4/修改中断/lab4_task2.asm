.386
code segment use16
    assume cs:code, ss:stack
old_int dw ?,?

NEW_INT:
    cmp ah, 00h
    jz OLD
    cmp ah, 10h
    jz OLD
    jmp dword ptr old_int
    jmp ee
OLD:
    pushf
    call dword ptr old_int
    cmp al, 'z'
    jb ee
    cmp al, 'a'
    ja ee
    sub al, 20h
ee:
    iret

start:
    xor ax, ax
    mov ds, ax
    mov ax, ds:[16H * 4]
    mov old_int, ax
    mov ax, ds:[16H * 4 + 2]
    mov old_int + 2, ax

    cli
    mov word ptr ds:[16H * 4], offset NEW_INT
    mov ds:[16H * 4 + 2], cs
    sti

    mov dx, offset start + 15
    shr dx, 4
    add dx, 10h

    mov al, 0
    mov ah, 31h
    int 21h
code ends
stack segment stack use16
    db 200 dup(0)
stack ends 
    end start