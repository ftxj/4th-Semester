.386
STACK  SEGMENT  USE16  STACK
       DB  256  DUP(0)
STACK  ENDS

DATA   SEGMENT USE16
N EQU 30
M EQU 5000
BUF	DB	'ZHANGSAN',0,0
	DB	100,85,80,?
	DB	'LISI',6 DUP(0)
	DB	80,100,70,?
	DB 	'TTTT',6 DUP(0)
	DB	69,69,69,?
	DB	'HLF',7 DUP(0)
	DB	91,91,91,?
	DB	N-5 DUP('TEMPVALUE',0,80,90,95,?)
	DB	'LIPEIHAO',0,0
	DB	85,100,85,?
IN_NAME	DB	11;Input buffer memory area
		DB ?;the length of input
		DB 11 DUP(0);the content of input
POIN	DW	0;to restore the aim of search result
PUT1	DB	'Please enter the student',27H,'s name to inquire!'
PUT0	DB	0AH,0DH,'$'
PUT2	DB	'SUCCESS_FIND!',0AH,0DH,'$'
PUT3	DB	'FAIL_FIND!',0AH,0DH,'$'
PUT4	DB	'THIS STUDENT',27H,'S RANK IS THE '
PUT5	DB	?,':',?,?,?,' !',0AH,0DH,'$'
CACH	DB 3 DUP(0)
		DB 7 DUP(1)
		DB 7 DUP(2)
		DB 7 DUP(3)
		DB 7 DUP(4)
		DB 7 DUP(5)
		DB 7 DUP(6)
		DB 7 DUP(7)
		DB 7 DUP(8)
		DB 7 DUP(9)
		DB 7 DUP(10)
		DB 7 DUP(11)
		DB 7 DUP(12)
		DB 7 DUP(13)
		DB 7 DUP(14)
		DB 7 DUP(15)
		DB 7 DUP(16)
		DB 7 DUP(17)
		DB 7 DUP(18)
		DB 7 DUP(19)
		DB 7 DUP(20)
		DB 7 DUP(21)
		DB 7 DUP(22)
		DB 7 DUP(23)
		DB 7 DUP(24)
		DB 7 DUP(25)
		DB 7 DUP(26)
		DB 7 DUP(27)
		DB 7 DUP(28)
		DB 7 DUP(29)
		DB 7 DUP(30)
		DB 7 DUP(31)
		DB 7 DUP(32)
		DB 7 DUP(33)
		DB 7 DUP(34)
		DB 7 DUP(35)
		DB 7 DUP(36)
		DB 7 DUP(37)
		DB 7 DUP(38)
		DB 7 DUP(39)
		DB 7 DUP(40)
		DB 7 DUP(41)
		DB 7 DUP(42)
		DB 7 DUP(43)
		DB 7 DUP(44)
		DB 7 DUP(45)
		DB 7 DUP(46)
		DB 7 DUP(47)
		DB 7 DUP(48)
		DB 7 DUP(49)
		DB 7 DUP(50)
		DB 7 DUP(51)
		DB 7 DUP(52)
		DB 7 DUP(53)
		DB 7 DUP(54)
		DB 7 DUP(55)
		DB 7 DUP(56)
		DB 7 DUP(57)
		DB 7 DUP(58)
		DB 7 DUP(59)
		DB 7 DUP(60)
		DB 7 DUP(61)
		DB 7 DUP(62)
		DB 7 DUP(63)
		DB 7 DUP(64)
		DB 7 DUP(65)
		DB 7 DUP(66)
		DB 7 DUP(67)
		DB 7 DUP(68)
		DB 7 DUP(69)
		DB 7 DUP(70)
		DB 7 DUP(71)
		DB 7 DUP(72)
		DB 7 DUP(73)
		DB 7 DUP(74)
		DB 7 DUP(75)
		DB 7 DUP(76)
		DB 7 DUP(77)
		DB 7 DUP(78)
		DB 7 DUP(79)
		DB 7 DUP(80)
		DB 7 DUP(81)
		DB 7 DUP(82)
		DB 7 DUP(83)
		DB 7 DUP(84)
		DB 7 DUP(85)
		DB 7 DUP(86)
		DB 7 DUP(87)
		DB 7 DUP(88)
		DB 7 DUP(89)
		DB 7 DUP(90)
		DB 7 DUP(91)
		DB 7 DUP(92)
		DB 7 DUP(93)
		DB 7 DUP(94)
		DB 7 DUP(95)
		DB 7 DUP(96)
		DB 7 DUP(97)
		DB 7 DUP(98)
		DB 7 DUP(99)
		DB 14 DUP(100)

DATA   ENDS

CODE   SEGMENT USE16
       ASSUME CS: CODE, DS: DATA, SS: STACK
START:	MOV AX,DATA
		MOV DS,AX
		MOV ES,AX

		MOV AX,STACK
		MOV SS,AX
		MOV SP,0100H

		JMP MENU;jump to the menu

OVER:	MOV AH,4CH;end the program
		INT 21H

MENU:
		CALL SUB0;invoke the SUB0 function
M00:	CALL SUB1;invoke the SUB1 function
		JMP M00
;*******************************************
SUB0 PROC	;calculate and restore the average grade
		MOV CX,N
		LEA EBX,BUF
S00:	PUSH EBX
		MOV DWORD PTR EAX,DS:[EBX+10];the  grade -> AL
		SHL EAX,1
		;MOV DX,0
		MOVZX DX,AL
		SHL DX,1
		;MOV BX,0
		MOVZX BX,AH
		ADD BX,DX
		SHR EAX,17
		XOR AH,AH;MOV AH,0
		ADD BX,AX;THE SUM -> BX
		MOV AL,CACH[BX]
		
		POP EBX
		ADD EBX,14
		MOV DS:[EBX-1],AL;restore the average grade
		LOOP S00
		RET
SUB0 ENDP
;*******************************************
SUB1 PROC;提示并输入学生姓名

		LEA DX,PUT1;输出提示符
		MOV AH,9
		INT 21H

		LEA DX,IN_NAME;输入学生姓名
		MOV AH,10
		INT 21H

		LEA DX,PUT0
		MOV AH,9
		INT 21H

		LEA BX,IN_NAME;输入为回车则重新提示输入
		MOV AL,0DH
		CMP AL,DS:[BX+2]
		JE	SUB1

		MOV AL,'Q';输入为q则退出
		CMP DS:[BX+2],AL
		JE	OVER

		MOV AL,'q';同上
		CMP DS:2[BX],AL
		JE OVER

		MOVZX AX,BYTE PTR DS:1[BX];MOV AL,DS:1[BX];换行符置0
		;MOV AH,0
		
		ADD BX,AX
		MOV BYTE PTR DS:2[BX],0

		
		XOR AX,AX;MOV AX,0
		CALL TIMER;START TO TIMER

		MOV CX,M
T2:		PUSH CX;USE STACK TO AVOID CONFLICT OF CX

		CALL SUB0

		
		CALL SEARCH;搜索学生姓名

		POP CX
		LOOP T2

		MOV AX,1
		CALL TIMER
		


		MOV CX,N
		LEA DI,BUF
		;CALL SEARNEW;搜索学生姓名



		RET
SUB1 ENDP
;*********************************************************
SEARCH PROC	;搜索学生姓名
		MOV CX,N
		LEA DI,BUF
S11:	PUSH EDI
		PUSH CX

		LEA EDX,IN_NAME+2
		MOV ESI,EDX;the site of IN_NAME -> SI
		
		
		
		MOV CL,IN_NAME+1
		MOV CH,0
		INC CX
		REPZ CMPSB
		JE SUCC
		
		POP CX
		POP EDI
		ADD EDI,14
		LOOP S11
		JMP FAIL

RETU:	RET


SUCC:	;查找成功

		LEA DX,PUT2
		MOV AH,9
		;INT 21H;AVOID OUTPUT EFFECT THE RESULT OF RUNTIME THE SAME BELOW

		
		POP CX
		POP EDI
		MOV WORD PTR [POIN],DI

		
		;CALL RANK
		
		JMP RETU

FAIL:;查找失败
		

		LEA DX,PUT3
		MOV AH,9
		;INT 21H
		
		JMP RETU
SEARCH ENDP
;*********************************************************
SEARNEW PROC	;搜索学生姓名
		LEA EDX,IN_NAME+2
S12:	PUSH EDI

		
		MOV ESI,EDX;the site of IN_NAME -> SI
		
		
		PUSH CX
		MOVZX CX,BYTE PTR IN_NAME+1
		INC CX
		REPZ CMPSB
		JE SUCC1
		POP CX

		POP EDI
		ADD EDI,14
		LOOP S12
		JMP FAIL1

RETU1:	RET


SUCC1:	;查找成功

		LEA DX,PUT2
		MOV AH,9
		INT 21H;AVOID OUTPUT EFFECT THE RESULT OF RUNTIME THE SAME BELOW

		POP CX
		POP EDI
		MOV WORD PTR [POIN],DI

		PUSHA
		CALL RANK
		POPA
		JMP RETU1

FAIL1:;查找失败
		PUSHA

		LEA DX,PUT3
		MOV AH,9
		INT 21H
		POPA
		JMP RETU1
SEARNEW ENDP
;********************************************
RANK PROC
		LEA BX,PUT5

		MOVZX AX,BYTE PTR DS:[DI+13]
		;MOV AH,0
		PUSH AX
		CMP AX,100
		MOV DL,10
		DIV DL
		ADD AL,30H
		ADD AH,30H
		MOV BYTE PTR DS:2[BX],AL
		MOV BYTE PTR DS:3[BX],AH
		POP AX
		CMP AX,100
		JNE LOW0
		MOV DL,'1'
		MOV BYTE PTR DS:2[BX],DL
LOW0:		CMP AX,90
		JB LOWA
		MOV DL,'A'
		JMP PT
LOWA:	CMP AX,80
		JB LOWB
		MOV DL,'B'
		JMP PT
LOWB:	CMP AX,70
		JB LOWC
		MOV DL,'C'
		JMP PT
LOWC:	CMP AX,60
		JB LOWD
		MOV DL,'D'
		JMP PT
LOWD:	MOV DL,'F'
PT:		MOV AH,9
		MOV BYTE PTR DS:[BX],DL
		LEA DX,PUT4
		INT 21H
		
		RET
RANK ENDP
;****************************************************
TIMER	PROC
	PUSH  DX
	PUSH  CX
	PUSH  BX
	MOV   BX, AX
	MOV   AH, 2CH
	INT   21H	     ;CH=hour(0-23),CL=minute(0-59),DH=second(0-59),DL=centisecond(0-100)
	MOV   AL, DH
	MOV   AH, 0
	IMUL  AX,AX,1000
	MOV   DH, 0
	IMUL  DX,DX,10
	ADD   AX, DX
	CMP   BX, 0
	JNZ   _T1
	MOV   CS:_TS, AX
_T0:	POP   BX
	POP   CX
	POP   DX
	RET
_T1:	SUB   AX, CS:_TS
	JNC   _T2
	ADD   AX, 60000
_T2:	MOV   CX, 0
	MOV   BX, 10
_T3:	MOV   DX, 0
	DIV   BX
	PUSH  DX
	INC   CX
	CMP   AX, 0
	JNZ   _T3
	MOV   BX, 0
_T4:	POP   AX
	ADD   AL, '0'
	MOV   CS:_TMSG[BX], AL
	INC   BX
	LOOP  _T4
	PUSH  DS
	MOV   CS:_TMSG[BX+0], 0AH
	MOV   CS:_TMSG[BX+1], 0DH
	MOV   CS:_TMSG[BX+2], '$'
	LEA   DX, _TS+2
	PUSH  CS
	POP   DS
	MOV   AH, 9
	INT   21H
	POP   DS
	JMP   _T0
_TS	DW    ?
 	DB    'Time elapsed in ms is '
_TMSG	DB    12 DUP(0)
TIMER   ENDP
;***********************************
disptime proc        ;ÏÔÊ¾ÃëºÍ°Ù·ÖÃë£¬¾«¶ÈÎª55ms¡£(Î´±£»¤ax¼Ä´æÆ÷)
    local timestr[8]:byte     ;0,0,'"',0,0,0dh,0ah,'$'

         push cx
         push dx         
         push ds
         push ss
         pop  ds
         mov  ah,2ch 
         int  21h
         xor  ax,ax
         mov  al,dh
         mov  cl,10
         div  cl
         add  ax,3030h
         mov  word ptr timestr,ax
         mov  timestr+2,'"'
         xor  ax,ax
         mov  al,dl
         div  cl
         add  ax,3030h
         mov  word ptr timestr+3,ax
         mov  word ptr timestr+5,0a0dh
         mov  timestr+7,'$'    
         lea  dx,timestr  
         mov  ah,9
         int  21h    
         pop  ds 
         pop  dx
         pop  cx
         ret
disptime	endp
CODE ENDS
	END START
