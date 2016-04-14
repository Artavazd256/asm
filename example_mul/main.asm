section .text
    global _start

_start:
    mov eax, 0xFFFFFFFF
    mov ebx, 0x5
    mul ebx 
     

    mov eax, 1 ; sys_exit
    mov ebx, 0 ; return value 
    int 0x80
