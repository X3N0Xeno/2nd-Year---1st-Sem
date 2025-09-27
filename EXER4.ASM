; Filename: Exer4.asm
; Name: Joseph Xeno O. Banzon
; Date: August 15, 2025

.model small ; directive to use "small" memory model
.code ; section of programming containing executable code
.stack 100 ; define the size of the program's stack
start: ; start of the program

    mov ah,02h 
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'B'
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl 
    int 21h

    mov ah,02h 
    mov cl,'U'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'M'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,'E'
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,0Ah
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'D'
    mov dl,cl 
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,':'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'2'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'2'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'-'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'0'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'0'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'5'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'2'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'-'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'3'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'6'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'2'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'F'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'R'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'M'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,':'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'J'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'P'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'H'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'X'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,0Ah
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'M'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'D'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'D'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'L'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'M'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,':'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'R'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'G'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'L'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'M'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,':'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'B'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'Z'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'C'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'U'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'R'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'D'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'Y'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'A'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'R'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,':'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'B'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'C'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,'-'
    mov dl,cl
    int 21h

    mov ah, 02h
    mov cl,'2'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,0Ah
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'C'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'H'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'L'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,':'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'C'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'B'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'U'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'U'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'F'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h
    
    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'C'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'H'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'L'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'O'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'G'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'Y'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'-'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'U'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'N'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'V'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'E'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'R'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'S'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'I'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'T'
    mov dl,cl
    int 21h

    mov ah,02h
    mov cl,'Y'
    mov dl,cl
    int 21h

int 27h
end start