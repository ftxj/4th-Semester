.386
STACK  SEGMENT  USE16  STACK
       DB  256  DUP(0)
STACK  ENDS

DATA   SEGMENT USE16
N EQU 5
T EQU 16
STU DB	N DUP('TEMPVALUE',0,80,90,95,?,?,?)
RANK DW N DUP(0)
PUT0	DB	0AH,0DH,15 DUP(0)
		DB  'MENU',0AH,0DH,0AH,0DH,6 DUP(0)
		DB '1.Logging the data of student',27h,'name and grades.',0AH,0DH,6 DUP(0)
		DB '2.Calculate the average.',0AH,0DH,6 DUP(0)
		DB '3.Calculate the rankings.',0AH,0DH,6 DUP(0)
		DB '4.Output report card.',0AH,0DH,6 DUP(0)
		DB '5.Exits program.',6 DUP(0)
PUT1	DB 	0AH,0DH,6 DUP(0),'$'
PUT2	DB  'Please input the number of function to choose:',0AH,0DH,6 DUP(0),'$'
PUT3	DB	'INPUT ERROR!Please input again:',0AH,0DH,6 DUP(0),'$'
SPUT1	DB 	0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB1:Logging!',0AH,0DH,6 DUP(0),'Please enter the serail number of the student want to modify:(Only 1-5!)',0AH,0DH,6 DUP(0),'$'
SP1_1	DB	0AH,0DH,6 DUP(0),'INPUT ERROR!Please input again:',0AH,0DH,6 DUP(0),'$'
SP1_2	DB	0AH,0DH,6 DUP(0),'Please enter the name of student',0AH,0DH,6 DUP(0),'$'
SP1_3	DB	0AH,0DH,6 DUP(0),'Please enter the Chinese grade(Only 0-100)',0AH,0DH,6 DUP(0),'$'
SP1_4	DB	0AH,0DH,6 DUP(0),'Please enter the Math grade(Only 0-100)',0AH,0DH,6 DUP(0),'$'
SP1_5	DB	0AH,0DH,6 DUP(0),'Please enter the English grade(Only 0-100)',0AH,0DH,6 DUP(0),'$'
SP1_6	DB	0AH,0DH,6 DUP(0),'Enter succeed!plause any key to the menu',0AH,0DH,6 DUP(0),'$'
SPUT2	DB	0AH,0DH,6 DUP(0),'This is SUB2.:Calculate!',0AH,0DH,'$'
SP2_1	DB	0AH,0DH,0AH,0DH,6 DUP(0),'Calculate succeed!plause any key to the menu',0AH,0DH,6 DUP(0),'$'
SPUT3	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB3.:Rank!',0AH,0DH,'$'
SPUT4	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB4.:Put!',0AH,0DH,'$'
SPUT5	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB5.:Exit!',0AH,0DH,6 DUP(0)
		DB 'Aborting...','$'
IN_PUT	DB	11;Input buffer memory area
COUNT	DB ?;the length of input
		DB  11 DUP(0);the content of input
DATA   ENDS

CODE   SEGMENT USE16
       ASSUME CS: CODE, DS: DATA, SS: STACK
START:	MOV AX,DATA
		MOV DS,AX
		MOV ES,AX

		MOV AX,STACK
		MOV SS,AX
		MOV SP,0100H

		;宏指令的定义
IO		MACRO A,B
		LEA DX,A
		MOV AH,B
		INT 21H
		ENDM
		JMP MENU;jump to the menu

;********************************************
;选择1=录入学生姓名和各科考试成绩，2=计算平均分，3=计算排名，4=输出成绩单，5=程序退出。
MENU:	
		MOV AX,0003H;清屏
		INT 10H
		IO PUT0,9;输出提示符
		IO PUT2,9


INP:	IO PUT0,1;输入选择
		IO PUT1,9
		;程序跳转
		CMP AL,'1'
		JE SUB1
		CMP AL,'2'
		JE SUB2
		CMP AL,'3'
		JE SUB3
		CMP AL,'4'
		JE SUB4
		CMP AL,'5'
		JE SUB5
		MOV AX,0003H
		INT 10H
		IO PUT0,9;输出提示符
		IO PUT3,9
		JMP INP
;********************************************
OVER:	MOV AH,4CH;end the program
		INT 21H
;********************************************
SUB1:	MOV AX,0003H;清屏
		INT 10H
		IO SPUT1,9;输出提示符
S1_1:	IO SPUT1,1;输入选择->AL!!!
		MOV AH,0
		PUSH AX
		CMP AL,'1';序号合法
		JB	S1ERR
		CMP AL,'5'
		JA 	S1ERR
S1_2:	IO SP1_2,9;输出提示姓名
		IO IN_PUT,10;输入学生姓名
		LEA BX,IN_PUT;输入为回车则重新提示输入
		MOVZX AX,BYTE PTR DS:[BX+1]
		CMP AX,0
		JE	S1_2
		ADD BX,AX
S1_3:	CMP AX,10;空白置零
		JNB S1_4
		INC AX
		MOV BYTE PTR DS:[BX+2],0
		JMP S1_3
S1_4:;字符串移动	
		POP AX
		SUB AX,31H
		MOV DL,T
		MUL DL
		LEA DI,STU
		ADD DI,AX
		LEA SI,IN_PUT
		ADD SI,2
		MOV CX,10
		CLD
		REP MOVSB

		;输入学生语文成绩
S1_5:	IO SP1_3,9
		IO IN_PUT,10
		LEA BX,COUNT
		MOVZX AX,BYTE PTR DS:[BX]
		CMP AX,4;输入合法
		JAE	S1_5
		CMP AX,3
		JNE S1_6
		MOV EAX,DWORD PTR 1[BX]
		CMP EAX,0D303031H
		JNE S1_5
		MOV BYTE PTR [DI],100

S1_6:	MOV AX,WORD PTR 1[BX]
		MOV DL,AH
		MOV DH,10
		AND AX,0FFH
		SUB AX,30H
		MUL DH
		MOV DH,0
		SUB DX,30H
		ADD AX,DX
		MOV BYTE PTR [DI],AL
		INC DI

		;输入学生数学成绩
S1_7:	IO SP1_4,9
		IO IN_PUT,10
		LEA BX,COUNT
		MOVZX AX,BYTE PTR DS:[BX]
		CMP AX,4;输入合法
		JAE	S1_7
		CMP AX,3
		JNE S1_8
		MOV EAX,DWORD PTR 1[BX]
		CMP EAX,0D303031H
		JNE S1_7
		MOV BYTE PTR [DI],100

S1_8:	MOV AX,WORD PTR 1[BX]
		MOV DL,AH
		MOV DH,10
		AND AX,0FFH
		SUB AX,30H
		MUL DH
		MOV DH,0
		SUB DX,30H
		ADD AX,DX
		MOV BYTE PTR [DI],AL
		INC DI

		;输入学生英语成绩
S1_9:	IO SP1_5,9
		IO IN_PUT,10
		LEA BX,COUNT
		MOVZX AX,BYTE PTR DS:[BX]
		CMP AX,4;输入合法
		JAE	S1_9
		CMP AX,3
		JNE S1_10
		MOV EAX,DWORD PTR 1[BX]
		CMP EAX,0D303031H
		JNE S1_9
		MOV BYTE PTR [DI],100

S1_10:	MOV AX,WORD PTR 1[BX]
		MOV DL,AH
		MOV DH,10
		AND AX,0FFH
		SUB AX,30H
		MUL DH
		MOV DH,0
		SUB DX,30H
		ADD AX,DX
		MOV BYTE PTR [DI],AL
		INC DI

		IO SP1_6,9
		IO SP1_6,1



		JMP MENU
S1ERR:	IO SP1_1,9
		JMP S1_1

;********************************************
SUB2:;计算平均分

		MOV AX,0003H;清屏
		INT 10H
		IO SPUT2,9;输出提示符

		MOV CX,N
		LEA EBX,STU
S00:	PUSH EBX
		MOV DWORD PTR EAX,DS:[EBX+10];the  grade -> AL
		SHL EAX,1
		MOVZX DX,AL
		SHL DX,1
		MOVZX BX,AH
		ADD BX,DX
		SHR EAX,17
		XOR AH,AH
		ADD AX,BX
		MOV BL,7
		DIV BL
		
		POP EBX
		ADD EBX,T
		MOV DS:[EBX-3],AL;restore the average grade
		LOOP S00

		IO SP1_6,9
		IO SP1_6,1

		JMP MENU
		;********************************************
SUB3:	;计算排名
		MOV AX,0003H;清屏
		INT 10H
		IO SPUT3,9;输出提示符
		

		;录入首地址至RANK
		MOV CX,N
		LEA DX,STU
		LEA BX,RANK
SP3_1:	MOV WORD PTR [BX],DX
		ADD DX,T
		ADD BX,2
		LOOP SP3_1

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
		;********************************************
SUB5:	MOV AX,0003H;清屏
		INT 10H
		;输出提示符
		IO SPUT5,9
		MOV CX,2
DELAY:	PUSH CX
		;1s延迟
		mov cx,0fh 
		mov dx,4240h ; 1 秒的延时 
		mov ah,86h 
		int 15h 
		POP CX
		LOOP DELAY
		JMP OVER
CODE ENDS
	END START
