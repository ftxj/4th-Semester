
.386
EXTRN SUB1: NEAR
EXTRN SUB2: NEAR
EXTERN SUB3: NEAR
EXTERN SUB4: NEAR
EXTERN SUB5: NEAR
PUBLIC STU
PUBLIC MENU

STACK  SEGMENT  USE16  PARA STACK 'STACK'
       DB  256  DUP(0)
STACK  ENDS

DATA   SEGMENT USE16 PARA PUBLIC 'D1'
N EQU 5
STU DB	N -2 DUP('TEMPVALUE',0,80,90,95,80,?,?)
	DB 	'lipeihao',0,0,1,1,1,?,?,?
	DB  'xinjie', 0, 0, 0, 0,100,100,100,90,?,?
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
DATA   ENDS

CODE   SEGMENT USE16 PARA PUBLIC 'C1'
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

JPP MACRO C,D
		CMP AL,C
		JE D
		ENDM

INP:	IO PUT0,1;输入选择
		IO PUT1,9
		;程序跳转
		JPP '1',SUB1
		JPP '2',SUB2
		JPP '3',SUB3
		JPP '4',SUB4
		JPP '5',SUB5

		MOV AX,0003H
		INT 10H
		IO PUT0,9;输出提示符
		IO PUT3,9
		JMP INP
CODE ENDS
	END START
