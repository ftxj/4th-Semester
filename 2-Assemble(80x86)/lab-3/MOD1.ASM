
	NAME MOD1
	EXTRN MENU:NEAR
	PUBLIC SUB3,SUB4

.386
STACK  SEGMENT  PARA STACK 'STACK'
       DB  256  DUP(0)
STACK  ENDS

DATA   SEGMENT PARA PUBLIC 'A1'
SP1_6	DB	0AH,0DH,6 DUP(0),'Enter succeed!plause any key to the menu',0AH,0DH,6 DUP(0),'$'
SPUT3	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB3.:Rank!',0AH,0DH,'$'
SPUT4	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB4.:Put!',0AH,0DH,'$'
DATA   ENDS

CODE   SEGMENT PARA PUBLIC 'B1'
       ASSUME CS: CODE, DS: DATA, SS: STACK
IO		MACRO A,B
		LEA DX,A
		MOV AH,B
		INT 21H
		ENDM
		;********************************************
SUB3:	;计算排名
		MOV AX,0003H;清屏
		INT 10H
		IO SPUT3,9;输出提示符
		

		;录入首地址至RANK
		;MOV CX,N   LEA DX,STU  	LEA BX,RANK SP3_1:	MOV WORD PTR [BX],DX ADD DX,15	ADD BX,2	LOOP SP3_1

		;任意键退出
		IO SP1_6,9
		IO SP1_6,1
		JMP MENU
		;********************************************
SUB4:	
		MOV AX,0003H;清屏
		INT 10H
		;输出提示符
		IO SPUT4,9
		

		;任意键退出
		IO SP1_6,9
		IO SP1_6,1
		JMP MENU
CODE ENDS
	END
