section .text
global _start

_start:
    mov eax, -5
    mov ebx, -5
    imul ebx

    mov eax, 1 ; sys_exit
    mov eax, 0 ; return value 
    int 0x80   ; interrupt 
