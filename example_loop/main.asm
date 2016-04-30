section .data
    msg: db "Hello %d wrold",10,0
    msgL: equ $-msg
section .text
    global main 
    extern printf 
main:
    
    mov rbx, 10 
    for_loop: 
    mov rdi, msg 
    mov rsi, rbx
    mov rcx, msgL
    xor rax, rax 
    call printf 
    dec rbx
    jnz for_loop 
    
    mov rdi, 60 
    mov rsi, 0
    syscall 

