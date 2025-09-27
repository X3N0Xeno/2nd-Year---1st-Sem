; Filename: Exer2.asm
; Name: Joseph Xeno O. Banzon
; Date: August 14, 2025

.model small ; directive to use "small" memory model
.code ; section of programming containing executable code
.stack 100 ; define the size of the program's stack
start: ; start of the program

    ;A
    mov ah,02h
    mov cl,41h 
    mov dl,cl
    int 21h

    ;B
    mov ah,02h
    mov cl,42h 
    mov dl,cl
    int 21h

    ;C
    mov ah,02h
    mov cl,43h
    mov dl,cl
    int 21h

    ;D
    mov ah,02h
    mov cl,44h
    mov dl,cl
    int 21h

    ;E
    mov ah,02h
    mov cl,45h
    mov dl,cl
    int 21h

    ;F
    mov ah,02h
    mov cl,46h
    mov dl,cl
    int 21h

    ;G
    mov ah,02h
    mov cl,47h
    mov dl,cl
    int 21h

    ;H
    mov ah,02h
    mov cl,48h
    mov dl,cl
    int 21h

    ;I
    mov ah,02h
    mov cl,49h
    mov dl,cl
    int 21h

    ;J
    mov ah,02h
    mov cl,4Ah
    mov dl,cl
    int 21h

    ;K
    mov ah,02h
    mov cl,4Bh
    mov dl,cl 
    int 21h

    ;L
    mov ah,02h
    mov cl,4Ch
    mov dl,cl
    int 21h

    ;M
    mov ah,02h 
    mov cl,4Dh 
    mov dl,cl 
    int 21h

    ;N
    mov ah,02h 
    mov cl,4Eh 
    mov dl,cl 
    int 21h

    ;O
    mov ah,02h 
    mov cl,4Fh 
    mov dl,cl 
    int 21h 

    ;P
    mov ah,02h 
    mov cl,50h 
    mov dl,cl 
    int 21h

    ;Q
    mov ah,02h
    mov cl,51h 
    mov dl,cl 
    int 21h 

    ;R
    mov ah,02h 
    mov cl,52h 
    mov dl,cl 
    int 21h 

    ;S
    mov ah,02h 
    mov cl,53h 
    mov dl,cl 
    int 21h 

    ;T
    mov ah,02h 
    mov cl,54h 
    mov dl,cl 
    int 21h 
    
    ;U
    mov ah,02h
    mov cl,55h
    mov dl,cl 
    int 21h

    ;V
    mov ah,02h
    mov cl,56h 
    mov dl,cl 
    int 21h

    ;W
    mov ah,02h 
    mov cl,57h 
    mov dl,cl 
    int 21h

    ;X
    mov ah,02h 
    mov cl,58h 
    mov dl,cl 
    int 21h
    
    ;Y
    mov ah,02h
    mov cl,59h 
    mov dl,cl 
    int 21h
    
    ;Z
    mov ah,02h
    mov cl,5Ah
    mov dl,cl
    int 21h


int 27h
end start