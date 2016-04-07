#! /bin/bash
nasm -f elf32 main.asm -g -o main.o
ld -m elf_i386 main.o -o main
rm main.o

