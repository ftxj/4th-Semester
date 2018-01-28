.model small
.data
SPUT5	DB 0AH,0DH,0AH,0DH,6 DUP(0),'This is SUB5.:Exit!',0AH,0DH,6 DUP(0)
		DB 'Aborting...','$'
.code 
public _SUB5
_SUB5 proc near
IO		MACRO A,B
		LEA DX,A
		MOV AH,B
		INT 21H
		ENDM
		MOV AX,0003H;清屏
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
OVER:	MOV AH,4CH;end the program
		INT 21H
		RET
_SUB5 endp

_text ends
end
