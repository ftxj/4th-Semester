.386
.model   flat,stdcall
option   casemap:none

WinMain  proto :DWORD,:DWORD,:DWORD,:DWORD
WndProc  proto :DWORD,:DWORD,:DWORD,:DWORD
Paint_Proc PROTO :DWORD, hDC:DWORD
Display  proto :DWORD

include      menuID.INC

include      windows.inc
include      user32.inc
include      kernel32.inc
include      gdi32.inc
include      shell32.inc

includelib   user32.lib
includelib   kernel32.lib
includelib   gdi32.lib
includelib   shell32.lib

return MACRO arg
        mov eax, arg
        ret
      ENDM



student	     struct
	     myname   db  10 dup(0)
	     chinese  db  0
	     math     db  0
	     english  db  0
	     average  db  0
	     grade    db  0
student      ends

.data
ClassName    db       'TryWinClass',0
AppName      db       'Our First Window',0
MenuName     db       'MyMenu',0
DlgName	     db       'MyDialog',0
AboutMsg     db       'I am ACM1501 Xin Jie',0
hInstance    dd       0
CommandLine  dd       0
buf	     student  <>
	     student  <'Jin',96,98,100,0,'A'>
	     student  <'Xin',90,90,90,0,'A'>
msg_name     db       'name',0
msg_chinese  db       'chinese',0
msg_math     db       'math',0
msg_english  db       'english',0
msg_average  db       'average',0
msg_grade    db       'grade',0
msg_frame	 db		  100 dup ('_')
chinese	     db       3,0,'___','() ','** '
math	     db       3,0,'99 ','100','89 '
english	     db       3,0,'99 ','100','90 '
average	     db       3,0,'   ','   ','   '

.code

Start:	     invoke GetModuleHandle,NULL ; 参数为 0(NULL) 表明获得此程序句柄
	     mov    hInstance,eax
	     invoke GetCommandLine
	     mov    CommandLine,eax
	     invoke WinMain,hInstance,NULL,CommandLine,SW_SHOWDEFAULT
	     invoke ExitProcess,eax
	     ;;


WinMain      proc   hInst:DWORD,hPrevInst:DWORD,CmdLine:DWORD,CmdShow:DWORD
	     LOCAL  wc:WNDCLASSEX  ;变量名：类型
	     LOCAL  msg:MSG
	     LOCAL  hWnd:HWND
		 local  mywidth:DWORD
		 local 	myheight:DWORD
             invoke RtlZeroMemory,addr wc,sizeof wc
	     mov    wc.cbSize,SIZEOF WNDCLASSEX ;这个结构体大小
	     mov    wc.style, CS_HREDRAW or CS_VREDRAW ;窗口风格
	     mov    wc.lpfnWndProc, offset WndProc  ;窗口消息处理的指针
	     mov    wc.cbClsExtra,NULL ;
	     mov    wc.cbWndExtra,NULL
	     push   hInst
	     pop    wc.hInstance ;处理的窗口的句柄
	     mov    wc.hbrBackground,COLOR_WINDOW+1 ;背景色
	     mov    wc.lpszMenuName, offset MenuName ;资源文件中描述菜单的资源文件名字符串的指针
	     mov    wc.lpszClassName,offset ClassName ; 指向类名称的指针
	     invoke LoadIcon,NULL,IDI_APPLICATION
	     mov    wc.hIcon,eax; hIcon 窗口图标资源
	     mov    wc.hIconSm,0
	     invoke LoadCursor,NULL,IDC_ARROW
	     mov    wc.hCursor,eax ; hCursor 光标资源
	     invoke RegisterClassEx, addr wc ;注册窗口
		 mov myheight, 500
		 mov mywidth, 800
	     INVOKE CreateWindowEx,NULL,addr ClassName,addr AppName,\
                    WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,\
                    CW_USEDEFAULT,mywidth,myheight,NULL,NULL,\
                    hInst,NULL ;创建窗口
	     mov    hWnd,eax ;执行成功返回窗口句柄
	     INVOKE ShowWindow,hWnd,SW_SHOWNORMAL
	     INVOKE UpdateWindow,hWnd
	     ;;
MsgLoop:     INVOKE GetMessage,addr msg,NULL,0,0 ;msg, 句柄,消息范围
             cmp    EAX,0 ; 0 是返回的退出消息
             je     ExitLoop
             INVOKE TranslateMessage,addr msg ;将键盘输入转化为对应ACSCII码
             INVOKE DispatchMessage,addr msg ; 转移到 窗口消息处理的指针所在函数
	     jmp    MsgLoop 
ExitLoop:    mov    eax,msg.wParam
	     ret
WinMain      endp

WndProc      proc   hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
	     LOCAL  hdc:DWORD
		 LOCAL Ps   :PAINTSTRUCT
     .IF     uMsg == WM_DESTROY
	     invoke PostQuitMessage,NULL
     .ELSEIF uMsg == WM_KEYDOWN
	    .IF     wParam == VK_F1
             ;;your code
	    .ENDIF
     .ELSEIF uMsg == WM_COMMAND
	    .IF     wParam == IDM_FILE_EXIT
		    invoke SendMessage,hWnd,WM_CLOSE,0,0 ;接受消息的窗口，要发送的消息，消息类别，消息类别
		.ELSEIF wParam == IDM_ACTION_AVERAGE
			call SET_AVERANGE_GRADE
	    .ELSEIF wParam == IDM_ACTION_LIST
		    invoke Display,hWnd
	    .ELSEIF wParam == IDM_HELP_ABOUT
		    invoke MessageBoxA,hWnd,addr AboutMsg,addr AppName,0 ;所属窗口，显示消息，标题，类型
	    .ENDIF
     .ELSEIF uMsg == WM_PAINT
		invoke BeginPaint,hWnd,ADDR Ps
		mov hdc, eax
		;invoke Paint_Proc,hWnd,hdc
		invoke EndPaint,hWnd,ADDR Ps
		return 0
	     ;;redraw window again
     .ELSE
             invoke DefWindowProc,hWnd,uMsg,wParam,lParam
             ret
     .ENDIF
  	     xor    eax,eax
	     ret
WndProc      endp
SET_AVERANGE_GRADE:
	 PUSH ESI
	 PUSH EAX
	 PUSH EBX
	 PUSH ECX
	 PUSH EDX

	 MOV SI, 0
	 MOV CX, 5
	MATH:
	 MOV AX, 0
	 MOV BX, 0
	 MOV DX, 0
	 MOV AL, buf[15].chinese
	 MOV AH, 2
	 MUL AH ;AX IS CHINESE * 2 <= 200 16 IS ENOUGH
	 MOV BL, buf[15].math;MATH GRADE

	 MOV BH, 0
	 ADD BX, AX
	 MOV AL, buf[15].english ;ENGLISH

	 MOV AH, 0
	 MOV DL, 2
	 DIV DL
	 ADD BX, AX
	 MOV AX, 2
	 MUL BX
	 MOV BL, 7
	 DIV BL

	 MOV buf[15].average, AL
	 ADD SI, 15
	 LOOP MATH

	 POP EDX
	 POP ECX
	 POP EBX
	 POP EAX
	 POP ESI
	 RET 


Display      proc   hWnd:DWORD
             XX     equ  10
             YY     equ  10
             N      EQU  0
	     XX_GAP equ  100
	     YY_GAP equ  30
CAL MACRO A,B
    invoke TextOut,hdc,XX+0*XX_GAP,YY+&A&*YY_GAP,offset buf[&B&*15].myname,3
    invoke TextOut,hdc,XX+1*XX_GAP,YY+&A&*YY_GAP,offset chinese+2+&B&*3,chinese
    invoke TextOut,hdc,XX+2*XX_GAP,YY+&A&*YY_GAP,offset math+2+&B&*3,   math
    invoke TextOut,hdc,XX+3*XX_GAP,YY+&A&*YY_GAP,offset english+2+&B&*3,english
    invoke TextOut,hdc,XX+4*XX_GAP,YY+&A&*YY_GAP,offset average+2+&B&*3,average
    invoke TextOut,hdc,XX+5*XX_GAP,YY+&A&*YY_GAP,offset buf[&B&*15].grade,1
ENDM
             LOCAL  hdc:HDC
             invoke GetDC,hWnd
             mov    hdc,eax
             invoke TextOut,hdc,XX+0*XX_GAP,YY+0*YY_GAP,offset msg_name,4
             invoke TextOut,hdc,XX+1*XX_GAP,YY+0*YY_GAP,offset msg_chinese,7
             invoke TextOut,hdc,XX+2*XX_GAP,YY+0*YY_GAP,offset msg_math,4
             invoke TextOut,hdc,XX+3*XX_GAP,YY+0*YY_GAP,offset msg_english,7
             invoke TextOut,hdc,XX+4*XX_GAP,YY+0*YY_GAP,offset msg_average,7
             invoke TextOut,hdc,XX+5*XX_GAP,YY+0*YY_GAP,offset msg_grade,5
             ;;
             invoke TextOut,hdc,XX+0*XX_GAP,YY+1*YY_GAP,offset msg_frame,67
             ;;
            CAL 2,0
            CAL 3,1
            CAL 4,2
             ret
Display      endp

             end  Start