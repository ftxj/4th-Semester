.386
STACK SEGMENT USE16 STACK
	DB 300 DUP(0)
STACK ENDS

DATA SEGMENT USE16
N 	    EQU  30
POIN    DW   0

BUF 	DB  'zhangsan', 0, 0 
		DB   0, 0, 0, ?
	    DB  'lisi', 6  DUP(0)
		DB   80, 100, 70, ?
		DB  'B',0,0,0,0,0,0,0,0,0
		DB   10, 20, 12, ?
		DB   N-4  DUP('TempValue',0, 80, 90, 95, ?) 
	    DB  'xinjie', 0, 0, 0, 0    
		DB   100, 100, 100, ?

IN_NAME DB   10
		DB   0 
		DB   10 DUP(0)
STRING  DB  300 DUP(0)
CRLF    DB   0DH, 0AH, '$'
MSG1 	DB 	 0AH, 0DH, 'Please Input Name :$'
MSG2    DB   0AH, 0DH, 'Not Find This Student!:$'
MSG3    DB   'Rank: '
DIVID	DB  7 DUP(0)
		db  7 dup(1)
		db  7 dup(2)
		db  7 dup(3)
		db  7 dup(4)
		db  7 dup(5)
		db  7 dup(6)
		db  7 dup(7)
		db  7 dup(8)
		db  7 dup(9)
		db  7 dup(10)
		db  7 dup(11)
		db  7 dup(12)
		db  7 dup(13)
		db  7 dup(14)
		db  7 dup(15)
		db  7 dup(16)
		db  7 dup(17)
		db  7 dup(18)
		db  7 dup(19)
		db  7 dup(20)
		db  7 dup(21)
		db  7 dup(22)
		db  7 dup(23)
		db  7 dup(24)
		db  7 dup(25)
		db  7 dup(26)
		db  7 dup(27)
		db  7 dup(28)
		db  7 dup(29)
		db  7 dup(30)
		db  7 dup(31)
		db  7 dup(32)
		db  7 dup(33)
		db  7 dup(34)
		db  7 dup(35)
		db  7 dup(36)
		db  7 dup(37)
		db  7 dup(38)
		db  7 dup(39)
		db  7 dup(40)
		db  7 dup(41)
		db  7 dup(42)
		db  7 dup(43)
		db  7 dup(44)
		db  7 dup(45)
		db  7 dup(46)
		db  7 dup(47)
		db  7 dup(48)
		db  7 dup(49)
		db  7 dup(50)
		db  7 dup(51)
		db  7 dup(52)
		db  7 dup(53)
		db  7 dup(54)
		db  7 dup(55)
		db  7 dup(56)
		db  7 dup(57)
		db  7 dup(58)
		db  7 dup(59)
		db  7 dup(60)
		db  7 dup(61)
		db  7 dup(62)
		db  7 dup(63)
		db  7 dup(64)
		db  7 dup(65)
		db  7 dup(66)
		db  7 dup(67)
		db  7 dup(68)
		db  7 dup(69)
		db  7 dup(70)
		db  7 dup(71)
		db  7 dup(72)
		db  7 dup(73)
		db  7 dup(74)
		db  7 dup(75)
		db  7 dup(76)
		db  7 dup(77)
		db  7 dup(78)
		db  7 dup(79)
		db  7 dup(80)
		db  7 dup(81)
		db  7 dup(82)
		db  7 dup(83)
		db  7 dup(84)
		db  7 dup(85)
		db  7 dup(86)
		db  7 dup(87)
		db  7 dup(88)
		db  7 dup(89)
		db  7 dup(90)
		db  7 dup(91)
		db  7 dup(92)
		db  7 dup(93)
		db  7 dup(94)
		db  7 dup(95)
		db  7 dup(96)
		db  7 dup(97)
		db  7 dup(98)
		db  7 dup(99)
		db  7 dup(100)

DATA ENDS

CODE SEGMENT USE16
	 ASSUME DS:DATA, CS:CODE, SS:STACK
START:
	 MOV AX, DATA
	 MOV DS, AX

INPUT:
	 MOV DX, OFFSET MSG1
	 MOV AH, 9
	 INT 21H ;功能一一小题

	 LEA DX, IN_NAME
	 MOV AH, 10
	 INT 21H ;功能一二小题

	 MOV BL, IN_NAME + 1
	 MOV BH, IN_NAME + 2

	 CMP BL, 0
	 JE INPUT
	 CMP BH, 'q'
	 JE DIE ;功能一 三小题
	 MOV BH, 0
	 MOV CX, 10
	 SUB CX, BX

PP:	 MOV [IN_NAME + BX + 2], 0
	 INC BX
	 LOOP PP

	 mov ax,0
	 call TIMER
	 mov cx, 5000
work1:
	 push cx
	 MOV DI, -14
FIND:
	 MOV CX, N
	 ADD DI, 14
FIND_S:

	 MOV EAX, DWORD PTR [IN_NAME + 2]
	 CMP EAX, DWORD PTR [BUF + DI]
	 JNE CON

	 MOV EBX, DWORD PTR [IN_NAME + 6]
	 CMP EBX, DWORD PTR [BUF + DI + 4]
	 JNE CON

	 MOV DX,  WORD PTR  [IN_NAME + 10]
	 CMP DX,  WORD PTR [BUF + DI + 8]
	 JE SUCCESS_FIND

	 CON: CMP CX, 0
	 JE NOT_FIND
	 LOOP FIND

DIE:
	 MOV AH, 4CH
	 INT 21H

NOT_FIND:
	 MOV DX, OFFSET MSG2
	 MOV AH, 9
	 INT 21H 
	 JMP INPUT

SUCCESS_FIND:

	 MOV WORD PTR [POIN], OFFSET BUF + 10
	 ADD WORD PTR [POIN], DI
	 CALL SET_AVERANGE_GRADE

	 pop cx
	 loop work1

	 mov ax,1
	 call TIMER

	 CALL G_ABCD
	 JMP INPUT

G_ABCD:
	 PUSH AX
	 PUSH DX
	 PUSH SI
	 MOV SI, [POIN]
	 ADD SI, 3
	 MOV AX, [SI]
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
	 MOV SI, 10
	 MOV CX, N
MATH:
	 MOV EDX, DWORD PTR [BUF + SI]
	 MOVZX BX, DL ;Chinese Grade
	 SHL BX, 1
	 MOVZX AX, DH ;MATH GRADE
	 ADD BX, AX
	 SHR EDX, 8
	 MOV AL, DH ;ENGLISH
	 SHR AX, 1
	 ADD BX, AX
	 SHL BX, 1
	 MOVZX AX, BYTE PTR [BX + DIVID]
	 MOV [BUF + SI + 3], AL
	 ADD SI, 14
	 LOOP MATH
	 RET 


;时间计数器(ms),在屏幕上显示程序的执行时间(ms)
;使用方法:
;	   MOV  AX, 0	;表示开始计时
;	   CALL TIMER
;	   ... ...	;需要计时的程序
;	   MOV  AX, 1	
;	   CALL TIMER	;终止计时并显示计时结果(ms)
;输出: 改变了AX和状态寄存器
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
 	DB    0AH, 0DH, 'Time elapsed in ms is '
_TMSG	DB    12 DUP(0)
TIMER   ENDP


CODE ENDS
	 END START
