section .data
    msg: db "Hello wrold", 10, 0
    msg_l: equ $-msg 

section .text
    global _start
_start: push 7
        mov eax, [esp]  
        add esp, 4 
        mov eax, 1
        mov ebx, 0
        int 0x80
    
