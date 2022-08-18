; 1:数据寄存器,一般称之为通用寄存器组
;      8086 有8个8位数据寄存器，
;      这些8位寄存器可分别组成16位寄存器：
;      AH&AL＝AX：累加寄存器，常用于运算；
;      BH&BL＝BX：基址寄存器，常用于地址索引；
;      CH&CL＝CX：计数寄存器，常用于计数；
;      DH&DL＝DX：数据寄存器，常用于数据传递。
;    2:地址寄存器/段地址寄存器
;      为了运用所有的内存空间，8086设定了四个段寄存器，专门用来保存段地址：
;      CS（Code Segment）：代码段寄存器；
;      DS（Data Segment）：数据段寄存器；
;      SS（Stack Segment）：堆栈段寄存器；
;      ES（Extra Segment）：附加段寄存器。
; 3：特殊功能的寄存器
;      IP（Instruction Pointer）：指令指针寄存器，与CS配合使用，可跟踪程序的执行过程；
;      SP（Stack Pointer）：堆栈指针，与SS配合使用，可指向目前的堆栈位置。
;      BP（Base Pointer）：基址指针寄存器，可用作SS的一个相对基址位置；
;      SI（Source Index）：源变址寄存器可用来存放相对于DS段之源变址指针；
;      DI（Destination Index）：目的变址寄存器，可用来存放相对于 ES 段之目的变址指针。
org 0x7c00
BaseOfStack equ 0x7c00
Label_start:
    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStack
    xchg bx,bx
; clean screen
    mov ax,0600h
    mov bx,0200h
    mov cx,0
    mov dx,0184fh
    int 10h
; set focus
    mov ax,0200h
    mov bx,0000h
    mov dx,0000h
    int 10h
; dispon screen : start Booting
    mov ax,1301h
    mov bx,000fh
    mov dx,0000h
    mov cx,7
    push ax
    mov ax,ds
    mov es,ax
    pop ax
    mov bp,StartBootMessage
    int 10h
; reset floppy
    xor ah,ah
    xor dl,dl
    int 13h
    jmp $
StartBootMessage: db "Start Boot"

; fill zero util whole sector
    times 510-($-$$) db 0
    dw 0xaa55