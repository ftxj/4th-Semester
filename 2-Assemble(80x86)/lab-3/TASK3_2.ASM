.model small
.data
MD DB 7
SPUT2	DB	0AH,0DH,6 DUP(0),'This is SUB2.:Calculate!',0AH,0DH,'$'
SP2_1	DB	0AH,0DH,0AH,0DH,6 DUP(0),'Calculate succeed!plause any key to the menu',0AH,0DH,6 DUP(0),'$'
PUT5	DB	0AH,0DH,6 DUP(0),'Enter succeed!plause any key to the menu',0AH,0DH,6 DUP(0),'$'
.code 
public _SUB2
_SUB2 proc near
	push si
    push ax
    push cx
    push dx
    push bp
    mov bp,sp
    mov BX,[bp+12]

IO		MACRO A,B
		LEA DX,A
		MOV AH,B
		INT 21H
		ENDM

;计算平均分

		MOV AX,0003H;清屏
		INT 10H
		IO SPUT2,9;输出提示符

		MOV CX,5
S00:	PUSH BX
		MOV  AL,DS:[BX+10];the  grade -> AL
		MOV AH,0
		SHL AX,1
		SHL AX,1
		MOV DH,0
		MOV DL,DS:[BX+11]
		SHL DX,1
		ADD AX,DX
		MOV DL,DS:[BX+12]
		MOV DH,0
		ADD AX,DX
		MOV BL,7
		DIV BL
		
		POP BX
		ADD BX,16
		MOV DS:[BX-3],AL;restore the average grade
		LOOP S00

       pop bp
       pop dx
       pop cx
       pop ax
       pop si
       ret 
_SUB2 endp
_text ends
end
