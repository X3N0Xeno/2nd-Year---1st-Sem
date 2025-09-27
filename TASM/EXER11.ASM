; Filename: Exer11.asm
; Choose and create your own multi-colored cartoon character
; Name: Joseph Xeno O. Banzon
; Date: August 28, 2025
putc MACRO char
    mov ah, 02h
    mov dl, char
    int 21h
ENDM
renderc MACRO char, page, color, write
    mov ah, 09h 
    mov al, char
    mov bh, page
    mov bl, color
    mov cx, write
    int 10h
ENDM
setcursor MACRO row, col
    mov ah, 02h
    mov bh, 00h
    mov dh, row
    mov dl, col
    int 10h
ENDM
colorz MACRO color, write
    mov ah, 09h 
    mov bl, color
    mov cx, write
    int 10h
ENDM
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


.stack 100h
start :
    mov ax, @data
    mov ds, ax

    ; Set to video mode 
    mov ah, 00h
    mov al, 03h ; 80x25 color text mode
    int 10h


	setcursor 1, 1
	renderc 32, 0, 4fh, 9

	setcursor 2, 0
	renderc 32, 0, 4fh, 1

	setcursor 2, 1
	renderc 32, 0, 7fh, 6

	setcursor 2, 7
	renderc 32, 0, 33h, 1

	setcursor 2, 8
	renderc 32, 0, 4fh, 2

	setcursor 3, 0
	renderc 32, 0, 4fh, 1

	setcursor 3, 1
	renderc 32, 0, 7fh, 6

	setcursor 3, 7
	renderc 32, 0, 33h, 1

	setcursor 3, 8
	renderc 32, 0, 4fh, 4

	setcursor 4, 0
	renderc 32, 0, 4fh, 1

	setcursor 4, 1
	renderc 32, 0, 33h, 7

	setcursor 4, 8
	renderc 32, 0, 4fh, 4

	setcursor 5, 0
	renderc 32, 0, 4fh, 12

	setcursor 6, 0
	renderc 32, 0, 4fh, 12

	setcursor 7, 0
	renderc 32, 0, 4fh, 10

	setcursor 8, 1
	renderc 32, 0, 4fh, 3

	setcursor 8, 5
	renderc 32, 0, 4fh, 3

	setcursor 9, 1
	renderc 32, 0, 4fh, 3

	setcursor 9, 5
	renderc 32, 0, 4fh, 3

    mov ah, 4Ch      ; DOS exit function
    mov al, 0        ; Return code 0
    int 21h          ; Call DOS interrupt
end start ; end program