; Filename: Exer8.asm
; Display colored patterns (big cross) using just spaces
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
;Row 1
    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,11h 
    mov cx,8 
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h

;Row 2
    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,11h 
    mov cx,3
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,44h 
    mov cx,2
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,11h 
    mov cx,3
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

;Row 3
    mov ah,2
    mov dl,0Ah
    int 21h

    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,11h 
    mov cx,1
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,44h 
    mov cx,6
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h
    
    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,11h 
    mov cx,1
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h

;Row 4
    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,11h 
    mov cx,3
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,44h 
    mov cx,2
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,11h 
    mov cx,3
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h

;Row 5
    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,11h 
    mov cx,3
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,44h 
    mov cx,2
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,11h 
    mov cx,3
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl,0Ah
    int 21h
    
;Row 6
    mov ah,09h
    mov bl,00h 
    mov cx,99
    int 10h

    mov ah,09h
    mov bl,11h 
    mov cx,8 
    int 10h

    mov ah,2
    mov dl,' '
    int 21h

int 27h
end start