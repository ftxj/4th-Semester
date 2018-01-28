;.386
STACK SEGMENT ;USE16 STACK
	DB 300 DUP(0)
STACK ENDS

DATA SEGMENT; USE16

space_0 db 'You want to slove my program? No possible$'

pwd1    db 'j' xor 0
        dw pwd2

space_1 db 'Oh, fuck hacker fuck you$'

N 	    EQU  3
POIN    DW   0

pwd2    db 'j' xor 'q'
        dw pwd3

BUF 	DB  ('l' - 30h) * 2, ('i' - 30h) * 2, ('p' - 30h) * 2, ('e' - 30h) * 2, ('i' - 30h) * 2
        DB  ('h' - 30h) * 2, ('a' - 30h) * 2, ('o' - 30h) * 2, 2  DUP((0  - 30h) * 2)
		DB  10 xor 'B', 10 xor 'B', 10 xor 'B', ?
	    DB  ('l' - 30h) * 2, ('i' - 30h) * 2, ('s' - 30h) * 2, ('i' - 30h) * 2
        DB  6  DUP((0  - 30h) * 2)
		DB  10 xor 'B', 10 xor 'B', 10 xor 'B', ?
	    DB  ('x' - 30h) * 2, ('i' - 30h) * 2, ('n' - 30h) * 2, ('j' - 30h) * 2, ('i' - 30h) * 2
        DB  ('e' - 30h) * 2, 4  DUP((0  - 30h) * 2)
		DB  100 xor 'B', 100 xor 'B', 100 xor 'B', ?

pwd3    db 'n' xor 'q'
        dw pwd4

IN_NAME DB   11
		DB   0 
		DB   11 DUP(0)

pwd4    db 'q' xor 'n'
        dw pwd5

CRLF    DB    0DH, 0AH, '$'

pwd5    db 'f' xor 'q'
        dw pwd6

MSG1 	DB 	 0AH, 0DH, 'Please Input Your Name :', '$'
MSG2    DB   0AH, 0DH, 'Not Find This Student!:$'

pwd6    db 'z' xor 'f'
        dw pwd7

MSGA 	DB   0AH, 0DH, 'A!$'
MSGB 	DB   0AH, 0DH, 'B!$'
MSGC 	DB   0AH, 0DH, 'C!$'
MSGD 	DB   0AH, 0DH, 'D!$'

pwd7    db 'Hope you have a good time! ^_^ $'
        dw 0
;input key
in_pwd  db 10
        db ?
        db 10 dup(0)
change  db 10 dup(0)

MSG3    db 'Please give me the key to prove you are owner', 0ah, 0dh
        db 'If you input the WRONG Key, exit' , 0ah, 0dh
        db '$'

;地址表，用于间接转移反跟踪
P1      dw first_encry
E1      dw DIE
P2      dw second_encry
P3      dw third_encry
E2      dw 10 dup(DIE)
PA      dw SET_AVERANGE_GRADE
E3      dw 10 dup(DIE)
P4      dw new_int
;中断矢量反追踪
old_int_1 dw 0, 0
old_int_3 dw 0, 0

DATA ENDS

CODE SEGMENT ;USE16
	 ASSUME DS:DATA, CS:CODE, SS:STACK
START:
	 MOV AX, DATA
	 MOV DS, AX

     lea dx, MSG3
     mov ah, 9
     int 21h

     xor ax, ax
     mov es, ax
     mov ax, es:[1 * 4]
     mov old_int_1, ax
     mov ax, es:[1 * 4 + 2]
     mov old_int_1 + 2, ax

     mov ax, es:[3 * 4]
     mov old_int_3, ax
     mov ax, es:[3 * 4 + 2]
     mov old_int_3 + 2, ax

     cli 
     mov ax, offset new_int
     mov es:[1 * 4], ax
     mov es:[1 * 4 + 2], cs
     mov es:[3 * 4], ax
     mov es:[3 * 4 + 2], cs
     sti

    lea dx, in_pwd ;input key
    mov ah, 10
    int 21h

judge_key:
    lea bx, in_pwd
    push bx
    mov al, [bx + 1]
    shr al, 1
    mov ah, 0
    mov si, ax
    mov di, 0

    mov bx, es:[1 * 4]
    inc bx
    jmp bx
    ;jmp x

    second_encry:
        mov al, [change + si]
        sub al, 63h
        jns su
        add al, 26
        su:
        mov ah, 0
        mov bl, 26
        div bl
        add ah, 61h
        mov [change + si], ah

        inc si
        dec cl
        jnz second_encry
    pop bx
    mov cl, [bx + 1]
    mov si, 0
    mov dx, 0
    mov al, 0
    jmp third_encry

    new_int: iret
    ;x:
    pop bx
    mov dx, [P2]
    first_encry:
        mov ah, [bx + di + 2]
        shl di, 1
        mov [change + di], ah
        mov ah, [bx + si + 2]
        mov [change + di + 1], ah
        xor ah, ah
        shr di, 1

        cli 
        push P1
        inc di
        add dx, di
        inc si 
        sub dx, ax 
        pop cx
        mov bp, sp
        mov cx, [bp - 2]
        sti 
        
        dec al
        jz  ooo
        jmp cx 
    ooo:
    mov cl, [bx + 1]
    mov si, 0
    push bx
    jmp dx
    db 'Your will die, goto die!$'

    third_encry:
        mov dl, [change + si]
        nop
        cmp ax, bx
        xor [change + si], al 
        mov al, dl
        cmp si, cx
        inc si
        dec cl
        jnz third_encry

    judge_key_end:
        mov si, 0
        mov di, 0
        mov al, [bx + 1]
        mov bx, OFFSET key_right
        push bx
        lea bx, pwd1
        oneByOne:
            mov cl, [bx]
            cmp cl, [change + si]
            jnz key_error
            mov bx, [bx + 1]
            inc si
            dec al
            jnz oneByOne
        pop ax
        mov bp, sp
        mov ax, [bp - 2]
        jmp ax 



key_right:
INPUT:
	 MOV DX, OFFSET MSG1
	 MOV AH, 9
	 INT 21H ;功能一一小题

	 LEA DX, IN_NAME
	 MOV AH, 10
	 INT 21H ;功能一二小题

     CALL SET_AVERANGE_GRADE
	 MOV BL, IN_NAME + 1
	 MOV BH, IN_NAME + 2

	 CMP BL, 0
	 JE INPUT
	 CMP BH, 'q'
	 JE DIE ;功能一 三小题
	 MOV BH, 0

FIND:
	 MOV CX, N
	 MOV DI, 0
FIND_S:
	 MOV SI, 0
	 PUSH CX
	 MOV CX, BX
	 CALL EQUAL
	 POP CX
	 CMP SI, BX
	 JE SUCCESS_FIND
CONTINUE_FIND:
	 CMP CX, 1
	 JE NOT_FIND
 	 ADD DI, 14
	 LOOP FIND_S

key_error:
DIE:
       cli                           ;还原中断矢量
       mov  ax, old_int_1
       mov  es:[1*4], ax
       mov  ax, old_int_1 + 2
       mov  es:[1*4+2], ax
       mov  ax, old_int_3
       mov  es:[3*4], ax
       mov  ax, old_int_3 + 2
       mov  es:[3*4+2], ax 
       sti

	 MOV AH, 4CH
	 INT 21H

NOT_FIND:
	 MOV DX, OFFSET MSG2
	 MOV AH, 9
	 INT 21H 
	 JMP INPUT

SUCCESS_FIND:
	 ADD SI, DI
	 CMP [BUF + SI], 0a0h
	 JNE CONTINUE_FIND
	 SUB SI, DI
	 MOV WORD PTR [POIN], OFFSET BUF + 10 
	 ADD WORD PTR [POIN], DI
	 CALL G_ABCD
	 JMP INPUT
 
;使用寄存器 AX,SI
;需要传入参数 SI = 0
EQUAL:
	 MOV AL, [IN_NAME + SI + 2]
     sub al, 30h
     shl al, 1
	 ADD SI, DI
	 CMP AL, [BUF + SI]
	 JNE NOT_EQUAL 
	 SUB SI, DI
	 INC SI
	 LOOP EQUAL
NOT_EQUAL:	 
	 RET



G_ABCD:
	 PUSH AX
	 PUSH DX
	 PUSH SI
	 MOV DX, OFFSET CRLF
	 MOV AH, 9
	 INT 21H
	 MOV SI, [POIN]
	 ADD SI, 3
	 MOV AX, [SI]
     xor al, 'B'
	 MOV AH, 0
	 SUB AL, 90
	 JS  G_BCD
	 MOV DL, 'A'
	 JMP SCREEN
G_BCD:
	 MOV AX, [SI]
	 MOV AH, 0
	 SUB AL, 80
	 JS  G_CD
	 MOV DL, 'B'
	 JMP SCREEN
G_CD:
	 MOV AX, [SI]
	 MOV AH, 0
	 SUB AL, 70
	 JS  G_D
	 MOV DL, 'C'
	 JMP SCREEN
G_D:
	 MOV DL, 'D'
	 JMP SCREEN
SCREEN:
	 MOV AH, 2
	 INT 21H
	 POP SI
	 POP DX
	 POP AX
	 RET 

SET_AVERANGE_GRADE:
	 PUSH SI
	 PUSH AX
	 PUSH BX
	 PUSH CX
	 PUSH DX

	 MOV SI, 10
	 MOV CX, N
        MATH:
	 MOV AX, 0
	 MOV BX, 0
	 MOV DX, 0
	 MOV AL, [BUF + SI]
     xor al, 'B'
	 MOV AH, 2
	 MUL AH ;AX IS CHINESE * 2 <= 200 16 IS ENOUGH
	 MOV BL, [BUF + SI + 1] ;MATH GRADE
     xor bl, 'B'
	 MOV BH, 0
	 ADD BX, AX
	 MOV AL, [BUF + SI + 2] ;ENGLISH
     xor al, 'B'
	 MOV AH, 0
	 MOV DL, 2
	 DIV DL
	 ADD BX, AX
	 MOV AX, 2
	 MUL BX
	 MOV BL, 7
	 DIV BL
     xor al, 'B'
	 MOV [BUF + SI + 3], AL
	 ADD SI, 14
	 LOOP MATH

	 POP DX
	 POP CX
	 POP BX
	 POP AX
	 POP SI
	 RET 

CODE ENDS
	 END START
