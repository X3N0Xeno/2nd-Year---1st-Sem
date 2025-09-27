; Filename: Exer1.asm
; Displaying single characters, numbers, and symbols
; Name: 
; Date: August 14, 2025

.model small ;  directive to use "small" memory model
.code ; section of program containing executable code
.stack 100 ; define the size of the program's stack.
start: ; start of program

    mov ah,02h  ; Set AH to display a character
    mov cl,13h  ; 41h is a capital letter A
    mov dl,cl   ; copies 8-bit value in cl and dl
    int 21h     ; interrupt for input/output


int 27h ; terminate
end start ; end program