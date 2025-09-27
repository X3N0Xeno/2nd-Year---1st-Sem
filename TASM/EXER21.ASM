; Filename: Exer21.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get 3 character inputs then display each character on its own line.

.MODEL small
.STACK 100h
.DATA
    inputChar1 db ?
    inputChar2 db ?
    inputChar3 db ?
    inputMsg1 db 'Enter first character: $'
    inputMsg2 db 'Enter second character: $'
    inputMsg3 db 'Enter third character: $'
    outputMsg1 db 13,10,'The first character is $'
    outputMsg2 db 13,10,'The second character is $'
    outputMsg3 db 13,10,'The third character is $'
    newline db 13,10,'$'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax

    ; Prompt for first character
    mov ah, 09h
    lea dx, inputMsg1
    int 21h

    mov ah, 01h
    int 21h
    mov inputChar1, al

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Prompt for second character
    mov ah, 09h
    lea dx, inputMsg2
    int 21h

    mov ah, 01h
    int 21h
    mov inputChar2, al

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Prompt for third character
    mov ah, 09h
    lea dx, inputMsg3
    int 21h

    mov ah, 01h
    int 21h
    mov inputChar3, al

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Output first character
    mov ah, 09h
    lea dx, outputMsg1
    int 21h

    mov ah, 02h
    mov dl, inputChar1
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Output second character
    mov ah, 09h
    lea dx, outputMsg2
    int 21h

    mov ah, 02h
    mov dl, inputChar2
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Output third character
    mov ah, 09h
    lea dx, outputMsg3
    int 21h

    mov ah, 02h
    mov dl, inputChar3
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    ; terminate program
    mov ah, 4ch
    int 21h

END ProgramStart