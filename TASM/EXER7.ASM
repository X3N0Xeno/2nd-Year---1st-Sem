; Filename: Exer7.asm
; Display with different foreground and background colors
; Name: Joseph Xeno O. Banzon
; Date: August 28, 2025

.model small ; directive to use "small" memory model
.code ; section of programming containing executable code
.stack 100 ; define the size of the program's stack
start: ; start of the program

COMMENT @
    Color Guide:
    0 = black
    1 = blue
    2 = murag green
    3 = murag white
    4 = rag purple
    5 = red
    6 = orange... guro
    7 = rag white (part 2)
    8 = BLINK na ni
    9 = neon typsh
    Symbol Guide:
    20 = space
@

    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,20h ; 2 = green thing(background), 0 = black(foreground)
    mov cx,7 ; number of characters to apply color
    int 10h

    mov ah,2
    mov dl,'C'
    int 21h

    mov ah,2
    mov dl,'o'
    int 21h

    mov ah,2
    mov dl,'l'
    int 21h

    mov ah,2
    mov dl,'l'
    int 21h

    mov ah,2
    mov dl,'e'
    int 21h

    mov ah,2
    mov dl,'g'
    int 21h

    mov ah,2
    mov dl,'e'
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h

    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,45h 
    mov cx,2
    int 10h

    mov ah,2
    mov dl,'o'
    int 21h    

    mov ah,2
    mov dl,'f'
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h

    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,67h
    mov cx,8 
    int 10h

    mov ah,2
    mov dl,'C'
    int 21h

    mov ah,2
    mov dl,'o'
    int 21h

    mov ah,2
    mov dl,'m'
    int 21h

    mov ah,2
    mov dl,'p'
    int 21h

    mov ah,2
    mov dl,'u'
    int 21h

    mov ah,2
    mov dl,'t'
    int 21h

    mov ah,2
    mov dl,'e'
    int 21h

    mov ah,2
    mov dl,'r'
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h

    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,54h 
    mov cx,7 
    int 10h

    mov ah,2
    mov dl,'S'
    int 21h

    mov ah,2
    mov dl,'t'
    int 21h

    mov ah,2
    mov dl,'u'
    int 21h

    mov ah,2
    mov dl,'d'
    int 21h

    mov ah,2
    mov dl,'i'
    int 21h

    mov ah,2
    mov dl,'e'
    int 21h

    mov ah,2
    mov dl,'s'
    int 21h

int 27h
end start