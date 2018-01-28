.386
STACK  SEGMENT  USE16  STACK
       DB  256  DUP(0)
STACK  ENDS

DATA   SEGMENT USE16
N EQU 30
STU DB	'TEMPVALUE',0,90,100,95,80,?,?
	DB  'xinjie',0,0,0,0,90,90,8,90,?,?
	DB	3  DUP('TEMPVALUE',0,90,100,95,80,?,?)
	DB  'xinjie',0,0,0,0,90,90,8,90,?,?
	DB  'xinjie',0,0,0,0,90,90,8,90,?,?
	DB  'xinjie',0,0,0,0,90,90,8,90,?,?
	DB  'xinjie',0,0,0,0,90,90,8,90,?,?
	DB  'xinjie',0,0,0,0,90,90,8,90,?,?
	DB	N-10  DUP('TEMPVALUE',0,90,100,95,80,?,?)

MODE  DB '+ Student   Chinese  Math  English  Aveg   Rank  +',0ah,0dh,'$'
GRADE DB '+                                                +',0ah,0dh,'$'
xiantiao DB '--------------------------------------------------',0ah,0dh,'$'
fanye db 'Please input A or D to change page A is Left D is Right ! ',0ah,0dh,'$'
DATA   ENDS

CODE   SEGMENT USE16
       ASSUME CS: CODE, DS: DATA, SS: STACK
START:
       MOV AX,DATA
       MOV DS,AX
       CALL RANK
       CALL GRADE_CODE
       mov ah, 4ch
   	   int 21h

RANK PROC NEAR
	    PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
		PUSH SI
		PUSH DI

       LEA BX,STU
       MOV SI,13
       MOV CX,N 
	FIRST_loop:     
		   MOV DH,1
		   MOV DI,13
		   MOV AH,DS:[BX + SI]
		   PUSH CX
		   MOV CX,N 
	SECOND_loop:
		   PUSH AX
	       SUB AH, BYTE PTR DS:[DI + BX]
	       JS _ONE_
	_TWO_:       
		   POP AX
	       ADD DI,16
	       LOOP SECOND_loop
	       MOV [BX + SI + 1],DH
	       ADD SI,16
	       POP CX
	       LOOP FIRST_loop

			POP DI
			POP SI
			POP DX
			POP CX
			POP BX
			POP AX
	       RET 
	_ONE_:
		   INC DH
		   JMP _TWO_
RANK ENDP

GRADE_CODE PROC NEAR
		PUSH EAX
		PUSH BX
		PUSH CX
		PUSH DX
		PUSH DI
		PUSH BP
		mov dx, offset xiantiao
		mov ah,9
		int 21h
		mov DX, OFFSET MODE
    	mov AH, 9H
        int 21h

   	   MOV CX,4
   	   LEA BX,GRADE
   	   LEA BP,STU
   	   MOV DI,10

OUT_GRADE:
		PUSH CX
		MOV CL,10

		MOV EAX,DS:[BP + DI -10]
		MOV [BX + 2], EAX
		MOV EAX,DS:[BP + DI -6]
		MOV [BX + 6], EAX
		MOV AX,DS:[BP + DI -2]
		MOV [BX + 10], AX
Chinese:
		MOV AX, DS:[BP + DI]
		MOV AH, 0
		DIV CL
		ADD AH, 30H
		ADD AL, 30H
		MOV [BX + 17], AL
		MOV [BX + 18], AH
		CMP AX, 303Ah
		JZ _CH_M_
		CMP AL, 30H
		JZ _CO_M_

Math:
		MOV AX, DS:[BP + DI + 1]
		MOV AH, 0
		DIV CL
		ADD AH, 30H
		ADD AL, 30H
		MOV [BX + 23], AL
		MOV [BX + 24], AH
		CMP AX, 303Ah
		JZ _CH_E_
		CMP AL, 30H
		JZ _CO_E_
English:
		MOV AX, DS:[BP + DI + 2]
		MOV AH, 0
		DIV CL
		ADD AH, 30H
		ADD AL, 30H
		MOV [BX + 32], AL
		MOV [BX + 33], AH
		CMP AX, 303Ah
		JZ _CH_A_
		CMP AL, 30H
		JZ _CO_A_

Aveg:
		MOV AX, DS:[BP + DI + 3]
		MOV AH, 0
		DIV CL
		ADD AH, 30H
		ADD AL, 30H
		MOV [BX + 38], AL
		MOV [BX + 39], AH
		CMP AX, 303Ah
		JZ _CH_R_
		CMP AL, 30H
		JZ _CO_R_
Rank2:
		MOV AX, DS:[BP + DI + 4]
		MOV AH, 0
		DIV CL
		ADD AH, 30H
		ADD AL, 30H
		MOV [BX + 45], AL
		MOV [BX + 46], AH
		CMP AL, 30H
		JZ _CO_Re_
EN:
		mov dx, offset GRADE
    	mov ah, 9h
        int 21h
        push di
        push cx
        mov di,1
        mov cx,48
chushihua:
        mov byte ptr [bx + di], 0
        inc di
        loop chushihua
        pop cx
        pop di

        ADD DI,16
        POP CX
        MOV AH,0
        MOV [BX + 31], AH
        MOV [BX + 22], AH
        MOV [BX + 16], AH
        SUB CX,1
		JNS OUT_GRADE
		mov dx, offset xiantiao
		mov ah,9
		int 21h
		mov dx,offset fanye
		mov ah,9
		int 21h
		mov ah,8
		int 21h
		cmp al,'d'
		je right
		cmp al,'a'
		je left
rett:
	POP BP
	POP DI
	POP DX
	POP CX
	POP BX
	POP EAX
	RET
right:
	;MOV AX,0003H;清屏
	;INT 10H
	mov cx,4
	jmp OUT_GRADE
left:
	;MOV AX,0003H;清屏
	;INT 10H
	sub DI,160
	JS rett
	mov cx,4
	jmp OUT_GRADE
_CH_M_:
	MOV AH,31h
	MOV AL,30H
	MOV [BX + 17], AL
	MOV [BX + 16], AH
	JMP Math
_CH_E_:
	MOV AH,31h
	MOV AL,30H
	MOV [BX + 23], AL
	MOV [BX + 22], AH
	JMP English
_CH_A_:
	MOV AH,31h
	MOV AL,30H
	MOV [BX + 32], AL
	MOV [BX + 31], AH
	JMP Aveg
_CH_R_:
	MOV AH,31h
	MOV AL,30H
	MOV [BX + 38], AL
	MOV [BX + 37], AH
	JMP Rank2

_CO_M_:
	MOV AL,0
	MOV [BX + 17], AL
	JMP Math
_CO_E_:
	MOV AL,0
	MOV [BX + 23], AL
	JMP English
_CO_A_:
	MOV AL,0
	MOV [BX + 32], AL
	JMP Aveg
_CO_R_:
	MOV AL,0
	MOV [BX + 38], AL
	JMP Rank2
_CO_Re_:
	MOV AL,0
	MOV [BX + 45], AL
	JMP EN
	
GRADE_CODE ENDP

CODE ENDS
END START