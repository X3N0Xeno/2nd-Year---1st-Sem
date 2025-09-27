; Filename: Exer3.asm
; Name: Joseph Xeno O. Banzon
; Date: August 14, 2025

.model small ; directive to use "small" memory model
.code ; section of programming containing executable code
.stack 100 ; define the size of the program's stack
start: ; start of the program

    mov ah,02h
    mov cl,31h
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,32h
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl 
    int 21h 

    mov ah,02h
    mov cl,33h
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,34h 
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,35h
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,36h
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,37h
    mov dl,cl 
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h 
    mov cl,38h 
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,39h
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,31h
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,30h
    mov dl,cl 
    int 21h

int 27h
end start