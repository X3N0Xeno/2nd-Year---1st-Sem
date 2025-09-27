; Filename: Exer19.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get string input and display back string.

.MODEL small
.STACK 100h
.DATA
    MAXIMUM_STRING_LENGTH EQU 1000
    StringInput db MAXIMUM_STRING_LENGTH DUP (?)
    inputPrompt db 'Enter text: $'
.code
ProgramStart:
    mov ax,@data
    mov ds,ax                       ; set ds to point to data segment

    ; prompt user for input
    mov dx, offset inputPrompt      ; load address of prompt message
    mov ah, 09h                     ; DOS print string function
    int 21h                         ; display time prompt

    mov ah, 3fh                     ; DOS read from handle function
    mov bx, 0                       ; Stantard input handle
    mov cx, MAXIMUM_STRING_LENGTH   ; read up to maximum number of characters

    mov dx, offset StringInput      ; store the string input here
    int 21h                         ; get the string
    and ax,ax                       ; were any characters read?
    jz Done                         ; jz = jump if zero. No, then jump to done
    mov cx, ax                      ; put the sting length in cx where you can us it as a counter

    push cx                         ; save the string length
    mov bx, offset StringInput

    pop cx                          ; get back the string length
    mov ah, 40h                     ; DOS write form handle function
    mov bx,1                        ; standard output handle
    mov dx, offset StringInput      ; point to string input
    int 21h                         ; print the string

    Done:
    ; terminate program
    mov ah, 4ch
    int 21h

END ProgramStart