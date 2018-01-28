.model small
.data
subMsg	db 'COMPLETED',0ah,0dh,0
MD db 7
.code
extrn  _printf:near
public _ave_s
_ave_s proc near
    push si
    push ax
    push cx
    push dx
    push bp
    mov bp,sp
    mov si,[bp+12]
    add si,10
    mov dx,0
    jmp XX21
XX20:  add si,13
XX21:  cmp dx,5
      jz PPPRE
      mov al,[si]
      mov ah,0     
      add ax,ax
      add ax,ax
      inc si
      mov cl,[si]
      mov ch,0
      add cx,cx
      add ax,cx
      inc si
      mov cl,[si]
      mov ch,0
      add ax,cx
      inc si
      div MD
      mov [si],al
      inc dx
      JMP XX20
PPPRE: NOP
       pop bp
       pop dx
       pop cx
       pop ax
       pop si
       ret    
_ave_s endp
_text ends
end
