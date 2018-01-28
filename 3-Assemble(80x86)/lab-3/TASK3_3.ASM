.model small
.data
N EQU 5
SPUT3	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB3.:Rank!',0AH,0DH,'$'
PUT6	DB	0AH,0DH,6 DUP(0),'Enter succeed!plause any key to the menu',0AH,0DH,6 DUP(0),'$'

.code 
public _SUB3
_SUB3 PROC NEAR
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
		PUSH SI
		PUSH DI
		push bp

		mov bp, sp

IO		MACRO A,B
		LEA DX,A
		MOV AH,B
		INT 21H
		ENDM
       mov BX,[bp + 16]
       MOV AX,0003H;清屏
		INT 10H
		IO SPUT3,9;输出提示符
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

       IO PUT6,9
		IO PUT6,1


       	pop bp
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
_SUB3 ENDP
_text ends
end
