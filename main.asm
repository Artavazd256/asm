section .data 
    msg: db "Hello world kukushka ",10,0
    msg_L: equ $-msg ; get length of msg variable 
section .bss
    array: resb msg_L
    array_L: equ $-array

section .text
    global _start


_start:

    push msg
    push array
    push msg_L
    call _copy
    
    mov eax, 4     ; sys_write 
    mov ebx, 1     ; stdout  
    mov ecx, array   ; set adderss of array varaible 
    mov edx, array_L ; set length of array variable 
    int 0x80       ; system interapt 
    
    push 0 
    call _exit


_copy:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]  ; set length of first argument 
    mov edi, [ebp+12] ; set address in the esi reg 
    mov esi, [ebp+16] ; set address in the edi reg 
    xor edx, edx      ; set zero value 
    mov ecx , 0x8     ; set 8 number 
    mul ecx           ; calculate byte count 
    xor edx, edx      ; set zero value 
    mov ecx, 0x20     ; set 32 number 
    div ecx           ; calculate dword count 
    for: 
    mov edx, [esi]    ; mov dword to edx reg
    mov [edi], edx    ; mov dword to addresss of edi reg
    inc edi           ; inc address 
    inc esi           ; inc address 
    dec ecx           ; dec ecx counter 
    cmp ecx, 0        ; if edx value is not zero then go to for section 
    jnz for           ; go to for section  
    pop ebp
    ret
    

_exit:    
    push ebp
    mov ebp, esp
    mov eax, 1       ; sys_exit
    mov ebx, [ebp+8] ; exit code 0
    int 0x80         ; system interapt 
    
