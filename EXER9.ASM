; Filename: Exer9.asm
; Display emojis and blinking characters (blinking red heart)
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
    mov bl,0Ah 
    mov cx,1
    int 10h

    mov ah,2
    mov dl,'I'
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,84h 
    mov cx,1
    int 10h

    mov ah,2
    mov dl,03h
    int 21h

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,09h
    mov bl,0Ah 
    mov cx,1
    int 10h

    mov ah,2
    mov dl,'U'
    int 21h

int 27h
end start