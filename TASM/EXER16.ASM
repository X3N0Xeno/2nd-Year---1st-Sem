; Filename: Exer16.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get character input and display back character input.

.MODEL small
.STACK 200h
.DATA
    inputChar db ?          ; db means define byte or reserve 1 byte of memory     
                            ; variable to store the input character
                            ; ? means don't assign an initial value to inputChar
    inputMsg db 'Enter a character: $'
    outputMsg db 13,10,'You entered: $'       ; 13,10 are carriage return and line feed for new line
.code
ProgramStart:
    ; initialize data segment
    mov ax,@data
    mov ds,ax
    
    ; diplay input message
    mov dx, offset inputMsg
    mov ah, 09h             ; 09h means print string function
    int 21h                 ; invoke DOS to print string

    ; get character input
    mov ah, 01h             ; 01h means get character input function
    int 21h                 ; invoke DOS to get character input
    mov inputChar, al       ; store the input character in inputChar variable

    ; display output message
    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

    ; display the character back
    mov dl, inputChar       ; move the input character to DL register
    mov ah, 02h             ; 02h means display character function
    int 21h                 ; invoke DOS to display character
    
    ; terminate program
    mov ah, 4ch
    int 21h

END ProgramStart