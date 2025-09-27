; Filename: Exer6.asm
; Display
; Name: Joseph Xeno O. Banzon
; Date: August 28, 2025

.model small ; directive to use "small" memory model
.code ; section of programming containing executable code
.stack 100 ; define the size of the program's stack
start: ; start of the program

    mov ah,02h 
    mov cl,'0'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'1'
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
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'3'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'4'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'5'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'6'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'7'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'8'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'9'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,0AH
    mov dl,cl
    int 21h
    
    mov ah,02h 
    mov cl,'<'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'>'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'('
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,')'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'{'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'}'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'['
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,']'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'#'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'_'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,0AH
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'*'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'/'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'+'
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
    mov cl,'%'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'@'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'&'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'!'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'?'
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,' '
    mov dl,cl
    int 21h

    mov ah,02h 
    mov cl,'$'
    mov dl,cl
    int 21h

int 27h
end start